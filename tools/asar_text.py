#!/usr/bin/env python3

from contextlib import contextmanager
from enum import Enum, auto
from functools import partial
from pathlib import Path
import re
from re import Match
import sys
from typing import Never, Iterator

DEFAULT_START_BLOCK = re.compile(r"^\s*;\s*@DEFAULT_TEXTBOX@\s*$")
NEW_BLOCK = re.compile(r"^\s*;\s*@NEW_TEXTBOX@\s*$")
ENDBLOCK = re.compile(r"^\s*;\s*@END@\s*$")
ENDSTRING = re.compile(r"^\s*;\s*@ENDSTRING@\s*$")
SINGLE_STRING = re.compile(r";\s*@STRING@ ")
INCSTMT = re.compile(r"^\s*incsrc\s*\"([^\"]+)\"\s*$")

SIMPLE_STRING = re.compile(r";\s*@STRING@ ")

LUT = [
    "Aber",
    "Bitte",
    "Bösen",
    "Du",
    "Dir",
    "Dich",
    "Deathtoll",
    "Die",
    "Der",
    "Dies",
    "Das",
    "Enblem",
    "Es",
    "GreenWood",
    "Heilkräuter",
    "Ich",
    "Juwelen",
    "König",
    "Königin",
    "Leo",
    "Lisa",
    "Monster",
    "Möchtest",
    "Menschen",
    "Mein",
    "Magridd",
    "Magie",
    "Notwendige",
    "Phoenix",
    "Rüstung",
    "Schloß",
    "Sie",
    "Stimme",
    "Schlüssel",
    "Stein",
    "Schwert",
    "Traumstab",
    "Traum",
    "Tages",
    "Vielleicht",
    "Wenn",
    "Welt",
    "Wir",
    "aber",
    "auf",
    "aus",
    "alle",
    "als",
    "auch",
    "bin",
    "bitte",
    "bewache",
    "bist",
    "die",
    "der",
    "den",
    "des",
    "das",
    "daß",
    "dem",
    "diese",
    "dieser",
    "ein",
    "eine",
    "einen",
    "erhielt",
    "etwas",
    "es",
    "einmal",
    "eines",
    "einer",
    "einem",
    "er",
    "für",
    "freigelassen",
    "gibt",
    "habe",
    "hast",
    "hier",
    "hat",
    "haben",
    "ich",
    "ist",
    "in",
    "immer",
    "im",
    "jetzt",
    "kann",
    "keine",
    "mich",
    "mit",
    "mir",
    "meine",
    "meinem",
    "meiner",
    "nicht",
    "noch",
    "nur",
    "namens",
    "nach",
    "paar",
    "sich",
    "sie",
    "sind",
    "sehr",
    "so",
    "schon",
    "und",
    "um",
    "uns",
    "von",
    "viele",
    "vielleicht",
    "vom",
    "werde",
    "wenn",
    "wieder",
    "werden",
    "wie",
    "wird",
    "wurde",
    "was",
    "wirst",
    "welche",
    "war",
    "zu",
    "zum",
    "zusammen",
]


class ParseException(Exception):
    def __init__(self, file: str, line: int, what: str):
        super().__init__(f"{file}:{line+1} : {what}")


class TranslateException(Exception):
    def __init__(self, what: str):
        super().__init__(f"Can't translate `{what}` to something useful")


class UnknownEscapeSequence(Exception):
    def __init__(self, what: str):
        super().__init__(f"Unknown escape sequence \\`{what}`")


class UnknownKeyword(ParseException):
    def __init__(self, file: str, line: int, what: str):
        super().__init__(file, line, f"I don't know what `{what}` is")


class UnsupportedContent(ParseException):
    def __init__(self, file: str, line: int, what: str):
        super().__init__(file, line, f"`{what}` is not supported. Please delete it")


class UnclosedQuote(ParseException):
    def __init__(self, file: str, line: int):
        super().__init__(file, line, "this quote is not properly closed")


class InvalidWidth(ParseException):
    def __init__(self, file: str, line: int, value: int, max_value: int):
        super().__init__(file, line, f"value {value:#x} exceeds maximum value of {max_value:#x}")


class DataWidth(Enum):
    BYTE = auto()
    WORD = auto()
    LONG = auto()
    DWORD = auto()

    def __str__(self) -> str:
        match self:
            case self.BYTE:
                return "db"
            case self.WORD:
                return "dw"
            case self.LONG:
                return "dl"
            case self.DWORD:
                return "dd"
            case _:
                return ""

    def width(self):
        match self:
            case self.BYTE:
                return 1
            case self.WORD:
                return 2
            case self.LONG:
                return 3
            case self.DWORD:
                return 4


class TextMapper:
    _regex = re.compile("( )")
    @staticmethod
    def map(txt: str) -> list[int]:
        res = []
        needs_space = False
        for word in TextMapper._regex.split(txt):
            if needs_space:
                needs_space = False
                if word == " ":
                    continue
                else:
                    # we needed a space but we got none
                    lut_idx = res.pop() - 0x80
                    for c in LUT[lut_idx]:
                        res.append(TextMapper._map_char(c))

            if word in LUT:
                res.append(LUT.index(word) + 0x80)
                needs_space = True
            else:
                escape_start = False
                it = iter(word)
                for c in it:
                    if escape_start:
                        if c == "\\":
                            res.append(TextMapper._map_char("\\"))
                        elif c == "x":
                            hi, lo = int(next(it), 16), int(next(it), 16)
                            res.append((hi << 4) | lo)
                        elif c == "n":
                            res.append(0x0D)
                        elif c == "0":
                            res.append(0x00)
                        else:
                            raise UnknownEscapeSequence(c)
                        escape_start = False
                    elif c == "\\":
                        escape_start = True
                    else:
                        res.append(TextMapper._map_char(c))

        if needs_space:
            # we needed a space but we got none
            lut_idx = res.pop() - 0x80
            for c in LUT[lut_idx]:
                res.append(TextMapper._map_char(c))

        return res

    @staticmethod
    def _map_char(c: str) -> int:
        if c.isascii() and c.isprintable():
            return ord(c)

        r = {
            "ß": 0x25,
            "Ü": 0x28,
            "ö": 0x2A,
            "ü": 0x5B,
            "↑": 0x5C,
            "↗": 0x5D,
            "→": 0x5E,
            "↘": 0x5F,
            "ä": 0x7B,
            "↓": 0x7C,
        }.get(c)

        if r is None:
            raise TranslateException(c)
        return r


Target = int | str
Tup = tuple[DataWidth, list[Target]]


class Translator:
    def __init__(self, path: Path):
        self._path = path
        self._cur_line: tuple[int, str] | None = None
        self._byte_list: list[list[Tup]] | None = None
        self._inc_paths: list[Path] = []
        self._transpiled: list[str] = []
        self._to_append: list[Tup] | None = None
        self._line_comment: str | None = None
        self._bold = False

    def transpile(self) -> str:
        if len(self._transpiled) == 0:
            text = self._path.read_text()
            for line_num, line in enumerate(text.splitlines()):
                self._cur_line = (line_num, line)
                self._process_line()

            self._transpiled.append("")  # append one empty line, so we have a newline in the end
        return "\n".join(self._transpiled)

    def inc_paths(self) -> list[Path]:
        return self._inc_paths

    def parse_int(self, txt: str, width: DataWidth | None = None) -> int | None:
        try:
            if (m := txt.removeprefix("$")) != txt:
                val = int(m, 16)
            elif (m := txt.removeprefix("%")) != txt:
                val = int(m, 2)
            else:
                val = int(m, 10)
        except ValueError:
            return None

        if width is not None:
            max_val = 1 << (8 * width.width())
            if val < max_val:
                return val
            else:
                self._raise(InvalidWidth, val, max_val)
        else:
            return val

    def _line_to_str(self, line) -> str | None:
        def target_to_str(target: tuple[DataWidth, Target]) -> str:
            dw, t = target
            if isinstance(t, str):
                return t

            return f"${t:0{dw.width() * 2}X}"

        _, x = line
        if len(x) > 0:
            dw, bytes = line
            return f"{dw} " + ",".join(target_to_str((dw, x)) for x in bytes)
        else:
            return None

    def _process_line(self):
        assert self._cur_line is not None
        (_, line) = self._cur_line
        if (m := INCSTMT.match(line)) is not None:
            self._inc_paths.append(Path(m.group(1)))
        elif DEFAULT_START_BLOCK.match(line):
            self._byte_list = [(DataWidth.BYTE, [0x10])]
        elif NEW_BLOCK.match(line):
            self._byte_list = []
        elif ENDBLOCK.match(line):
            self._end_line()
        elif ENDSTRING.match(line):
            self._end_line(append_null=True)
        elif (m := SINGLE_STRING.search(line)) is not None:
            self._single_string(m, line)
            return  # we do a return here, because this is a single line comment
        elif self._byte_list is not None:
            if line.startswith(("db", "dw", "dl", "dd")):
                # we ignore these ones and replace them later with our code
                return
            elif line.startswith(";;"):
                # this is a comment inside a comment, let's ignore, but not delete it
                pass
            elif (rest := line.removeprefix(";")) is not line:
                self._parse_comment(rest)
            else:
                self._raise(UnsupportedContent, line)
        self._transpiled.append(line)

    def _single_string(self, match: Match[str], string: str):
        self._byte_list = []
        self._parse_comment(string[match.end() :], auto_newline=False)

        assert len(self._byte_list) > 0
        assert self._to_append is None

        self._to_append = self._byte_list[-1]
        self._append(0)
        self._byte_list[-1] = self._to_append
        self._to_append = None

        self._line_comment = string[match.start() :]
        self._end_line()

    def _iter_args(self, text: str) -> Iterator[str]:
        while len(text) > 0:
            if text.startswith(" "):
                text = text.lstrip()
            elif text.startswith("*"):
                yield text[0]
                text = text[1:]
            elif text.startswith('"'):
                pos = 1
                while True:
                    next_pos = text.find('"', pos)
                    if next_pos == -1:
                        self._raise(UnclosedQuote)
                    elif text[next_pos - 1] == "\\":
                        # quote is escaped, search next one
                        pos = next_pos
                    else:
                        pos = next_pos + 1
                        break
                yield text[:pos]
                text = text[pos:]
            elif (pos := text.find(" ")) != -1:
                yield text[:pos]
                text = text[pos:]
            else:
                yield text
                text = ""

    def _append(self, data: list[Target] | Target, size: DataWidth = DataWidth.BYTE):
        if self._to_append is None:
            self._to_append = []
        if not isinstance(data, list):
            data = [data]
        if len(self._to_append) > 0 and self._to_append[-1][0] == size:
            self._to_append[-1][1].extend(data)
        else:
            self._to_append.append((size, data))

    def _parse_comment(self, comment: str, auto_newline: bool = True):
        assert self._byte_list is not None

        iterator = self._iter_args(comment)
        new_line = False

        for arg in iterator:
            new_line = False
            if arg.startswith('"'):
                assert arg[-1] == '"'
                self._append(TextMapper.map(arg[1:-1]))
                new_line = True
            elif arg == "*":
                if self._bold:
                    self._append([0x03, 0x20])
                else:
                    self._append([0x03, 0x24])
                self._bold = not self._bold
            elif arg == "WFE":
                self._append(0x11)
            elif arg == "WFAK":
                self._append(0x12)
            elif arg == "SETPOS":
                pos_x = next(iterator)
                pos_y = next(iterator)

                if (m := self.parse_int(pos_x, DataWidth.BYTE)) is None:
                    self._raise(ParseException, f"Cannot parse position x `{pos_x}`")
                else:
                    pos_x = m
                if (m := self.parse_int(pos_y, DataWidth.BYTE)) is None:
                    self._raise(ParseException, f"Cannot parse position y `{pos_y}`")
                else:
                    pos_y = m

                self._append([0x01, pos_x, pos_y])
            elif arg == "DRAWBOX":
                width = next(iterator)
                height = next(iterator)

                if (m := self.parse_int(width, DataWidth.BYTE)) is None:
                    self._raise(ParseException, f"Cannot parse drawbox width `{width}`")
                else:
                    width = m
                if (m := self.parse_int(height, DataWidth.BYTE)) is None:
                    self._raise(ParseException, f"Cannot parse drawbox height `{height}`")
                else:
                    height = m

                self._append([0x07, width, height])
            elif arg == "CONT":
                self._append(0x0C)
            elif arg == "PLAYER_NAME":
                self._append([2, 2])
            elif arg == "NEWLINE":
                self._append(0x0D)
            elif arg == "NO_NEWLINE":
                pass
            elif arg == "->":
                target = next(iterator)
                if (m := self.parse_int(target, DataWidth.WORD)) is not None:
                    target = m

                self._append(0x13)
                self._append(target, DataWidth.WORD)
            elif arg == "WAIT":
                amount = next(iterator)
                if self.parse_int(amount, DataWidth.BYTE) is None:
                    self._raise(ParseException, f"Cannot parse number to wait `{amount}`")

                self._append([0x0E, amount])
            elif arg == "LOOKUP":
                table = next(iterator)
                offset = next(iterator)

                if (m := self.parse_int(table, DataWidth.WORD)) is not None:
                    table = m
                if (m := self.parse_int(offset, DataWidth.WORD)) is not None:
                    offset = m

                self._append(0x05)
                self._append([table, offset], DataWidth.WORD)
            elif arg == "DECVAL":
                width = next(iterator)
                addr = next(iterator)

                if (m := self.parse_int(width, DataWidth.BYTE)) is None:
                    self._raise(ParseException, f"Cannot parse width `{width}`")
                else:
                    width = m
                if (m := self.parse_int(addr, DataWidth.WORD)) is not None:
                    addr = m

                self._append([0x06, width])
                self._append(addr, DataWidth.WORD)
            elif arg == "REPEAT":
                amount = next(iterator)
                addr = next(iterator)

                if (m := self.parse_int(amount, DataWidth.BYTE)) is None:
                    self._raise(ParseException, f"Cannot parse amount `{amount}`")
                else:
                    width = m
                if (m := self.parse_int(addr, DataWidth.WORD)) is not None:
                    addr = m

                self._append([0x0B, amount])
                self._append(addr, DataWidth.WORD)
            else:
                self._raise(UnknownKeyword, arg)

        if new_line and auto_newline:
            self._append(0x0D)

        append = self._to_append
        self._to_append = None
        self._byte_list.append(append)

    def _end_line(self, append_null=False):
        if self._byte_list is None:
            self._raise(ParseException, "@END@ without begin")

        for byte in self._byte_list:
            if isinstance(byte, tuple):
                self._transpiled.append(self._line_to_str(byte))
            else:
                self._transpiled.append(" : ".join(x for x in map(self._line_to_str, byte) if x is not None))

        if append_null:
            self._transpiled.append("db $00")
        if self._line_comment is not None:
            self._transpiled[-1] += " " + self._line_comment
            self._line_comment = None

        self._byte_list = None

    def _raise(self, type: type, *args) -> Never:
        assert self._cur_line is not None
        from inspect import signature

        curried = partial(type, self._path, self._cur_line[0])
        raise curried(*args)

        # sig = signature(type)
        # param_len = len(sig.parameters)
        # if param_len == 2:
        #     assert what is None
        #     raise type(self._path, self._cur_line[0])
        # elif param_len == 3:
        #     raise type(self._path, self._cur_line[0], what)
        # else:
        #     assert False, f"Unsupported thing {sig}"


def crawl(path: Path):
    todo = [path]
    while len(todo) > 0:
        path = todo.pop()
        translator = Translator(path)
        # print(translator.transpile())
        transpiled = translator.transpile()
        path.write_text(transpiled)
        todo.extend(path.parent / inc for inc in reversed(translator.inc_paths()))


if __name__ == "__main__":
    main = sys.argv[1]
    crawl(Path(main))
