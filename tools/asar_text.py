#!/usr/bin/env python3

from enum import Enum, auto
from pathlib import Path
import re
import sys
from typing import Never, Iterator

START_BLOCK = re.compile(r"^;\s*@TEXTBOX@\s*$")
CONTINUE_BLOCK = re.compile(r"^;\s*@TEXTCONT@\s*$")
ENDBLOCK = re.compile(r"^;\s*@END@\s*$")
INCSTMT = re.compile(r"^\s*incsrc\s*\"([^\"]+)\"\s*$")

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
    @staticmethod
    def map(txt: str) -> list[int]:
        res = []
        skip_space = False
        for word in re.split("( )", txt):
            if skip_space and word == " ":
                continue
            skip_space = False
            if word in LUT:
                res.append(LUT.index(word) + 0x80)
                skip_space = True
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
                        else:
                            raise UnknownEscapeSequence(c)
                        escape_start = False
                    elif c == "\\":
                        escape_start = True
                    else:
                        res.append(TextMapper._map_char(c))

        return res

    @staticmethod
    def _map_char(c: str) -> int:
        if c.isascii() and c.isprintable():
            return ord(c)

        r = {
            "ä": 0x7B,
            "ö": 0x2A,
            "ü": 0x5B,
            "Ü": 0x28,
            "ß": 0x25,
        }.get(c)

        if r is None:
            raise TranslateException(c)
        return r


Target = int | str
Tup = tuple[DataWidth, list[Target]]


class Translator:
    def __init__(self, path: Path):
        self._path = path
        self._cur_line = None
        self._byte_list = None
        self._inc_paths = []
        self._transpiled = []
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

    def _line_to_str(self, line) -> str | None:
        def target_to_str(target: tuple[DataWidth, Target]) -> str:
            dw, t = target
            if isinstance(t, str):
                return t

            return f"${t:0{dw.width() * 2}X}"

        _, x = line
        if len(x) > 0:
            dw, bytes = line
            return f"{dw} " + ", ".join(target_to_str((dw, x)) for x in bytes)
        else:
            return None

    def _process_line(self):
        assert self._cur_line is not None
        (_, line) = self._cur_line
        if (m := INCSTMT.match(line)) is not None:
            self._inc_paths.append(m.group(1))
        elif START_BLOCK.match(line):
            self._byte_list = [(DataWidth.BYTE, [0x10])]
        elif CONTINUE_BLOCK.match(line):
            self._byte_list = []
        elif ENDBLOCK.match(line):
            self._end_line()
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

    def _parse_comment(self, comment: str):
        to_append = []

        def _append(data: list[Target] | Target, size: DataWidth = DataWidth.BYTE):
            nonlocal to_append

            if not isinstance(data, list):
                data = [data]
            if len(to_append) > 0 and to_append[-1][0] == size:
                to_append[-1][1].extend(data)
            else:
                to_append.append((size, data))

        assert self._byte_list is not None

        iterator = self._iter_args(comment)
        new_line = False

        for arg in iterator:
            new_line = False
            if arg.startswith('"'):
                assert arg[-1] == '"'
                _append(TextMapper.map(arg[1:-1]))
                new_line = True
            elif arg == "*":
                if self._bold:
                    _append([0x03, 0x20])
                else:
                    _append([0x03, 0x24])
                self._bold = not self._bold
            elif arg == "WFE":
                _append(0x11)
            elif arg == "CONT":
                _append(0x0C)
            elif arg == "PLAYER_NAME":
                _append([2, 2])
            elif arg == "NO_NEWLINE":
                pass
            elif arg == "->":
                target = next(iterator)
                try:
                    int(target, 16)
                    target = "$target"
                except ValueError:
                    pass

                _append(0x13)
                _append(target, DataWidth.WORD)
            elif arg == "WAIT":
                amount = next(iterator)
                try:
                    num = int(amount, 0)
                    # TODO assert value is small enough
                    _append([0x0E, num])
                except ValueError:
                    self._raise(ParseException, "Cannot parse numer to wait `{amount}`")
            else:
                self._raise(UnknownKeyword, arg)

        if new_line:
            _append(0x0D)

        self._byte_list.append(to_append)

    @profile
    def _end_line(self):
        if self._byte_list is None:
            self._raise(ParseException, "@END@ without begin")

        for byte in self._byte_list:
            if isinstance(byte, tuple):
                self._transpiled.append(self._line_to_str(byte))
            else:
                self._transpiled.append(" : ".join(x for x in map(self._line_to_str, byte) if x is not None))

        self._byte_list = None

    def _raise(self, type: type, what: str | None = None) -> Never:
        assert self._cur_line is not None
        from inspect import signature

        sig = signature(type)
        param_len = len(sig.parameters)
        if param_len == 2:
            assert what is None
            raise type(self._path, self._cur_line[0])
        elif param_len == 3:
            raise type(self._path, self._cur_line[0], what)
        else:
            assert False, f"Unsupported thing {sig}"


@profile
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
