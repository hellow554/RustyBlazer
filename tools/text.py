#!/usr/bin/env python3

import argparse
import random
from typing import Callable, Iterator, List, Tuple


class Addr:
    def __init__(self, addr: int):
        self._addr = addr

    @property
    def addr(self) -> int:
        return self._addr

    @property
    def ida_bank(self) -> int:
        return 0x80 + self._addr // 0x8000

    @property
    def ida_addr(self) -> int:
        return self._addr % 0x8000 + 0x8000

    def __add__(self, other):
        if isinstance(other, int):
            return Addr(self._addr + other)
        else:
            raise Exception("other operand must be an int!")


class IdaAddr(Addr):
    def __init__(self, *args, **kwargs):
        if len(args) == 1:
            bank = args[0][1:3]
            if (_ := bank.removeprefix("C")) != bank:
                bank = int(bank, 16) - 0xC0
                offset = int(args[0][4:], 16)
                super().__init__(bank * 0x10000 + offset)
            else:
                bank = int(bank, 16)
                if bank > 0xC0:
                    bank -= 0xC0
                else:
                    bank -= 0x80
                offset = int(args[0][4:], 16) - 0x8000
                super().__init__(bank * 0x8000 + offset)

        else:
            assert len(args) == 0, "Either provide one argument or `bank` and `offset`"

            bank = kwargs["bank"]
            offset = kwargs["offset"]
            return self.__init__(f".{bank:02x}:{offset:04x}")


class ROM:
    ROM_IMAGE_PATH = "/home/marcel/projects/RustyBlazer/german.sfc"
    content = []

    @classmethod
    def load(cls):
        with open(cls.ROM_IMAGE_PATH, "rb") as f:
            cls.content = f.read()

    def __class_getitem__(cls, idx) -> bytes:
        if len(cls.content) == 0:
            ROM.load()

        if isinstance(idx, Addr):
            idx = idx.addr

        return cls.content.__getitem__(idx)


class SbChar:
    def __init__(self, ch: int):
        self.ch = ch

    def __repr__(self) -> str:
        return f"SbChar({str(self)})"

    def __str__(self) -> str:
        return self.get().rstrip()  # remove the trailing whitespace

    def get(self) -> str:
        if self.ch & 0x80 != 0:
            return self.lut()

        return self.special() or chr(self.ch)

    def special(self) -> str | None:
        return {
            # Box drawing
            0x01: "\u250f",  # top left corner
            0x02: "\u2513",  # top right corner
            0x03: "\u2594",  # top border
            0x04: "\u2581",  # bottom border
            0x05: "\u2517",  # bottom left corner
            0x06: "\u251b",  # bottom right corner
            0x07: "\u258F",  # left border
            0x08: "\u2595",  # right border
            # PLAYER and ENEMY
            0x0A: "P",
            0x0B: "L",
            0x0C: "A",
            0x0D: "Y",
            0x0E: "E",
            0x0F: "R",
            0x10: "E",
            0x11: "N",
            0x12: "E",
            0x13: "M",
            0x14: "",
            0x15: "Y",
            # Health bar
            0x1B: "\u25A0",
            0x1C: "\u25ae",
            0x1D: "\u25e7",
            0x1E: "\u25eb",
            0x1F: "\u25af",
            # special chars
            0x23: "\u2419",
            0x24: "\u2408",
            0x25: "ß",
            0x26: "\u2694",
            0x27: "\u26e8",
            0x28: "Ü",
            0x29: "Ö",
            0x2a: "ö",
            0x2b: "▶",
            # TODO: topleft corner, bottomright corner, topleft big corner, sidewards heart, comma, hyphen, full stop, slash
            # TODO: numbers, colon, middle square,
            # TODO: depending on the context, 0x3d can also be a small heart
            0x3C: "\u201f",
            0x3D: "\U0001f783",
            0x3E: "\u201d",
            0x5B: "ü",
            0x5C: "↑",
            0x5D: "↗",
            0x5E: "→",
            0x5F: "↘",
            0x7B: "ä",
            0x7C: "↓",
            0x7D: "Ä",
            # TODO: enix logo
        }.get(self.ch)

    def lut(self) -> str:
        base_addr = IdaAddr(".C6:C000").addr
        # base_addr = IdaAddr(".90:8000").addr
        idx = self.ch & 0x7F
        idx *= 12
        return ROM[base_addr + idx : base_addr + idx + 12].decode("ASCII").rstrip("\x00") + "␣"


class SbString:
    def __init__(self, start_addr: Addr):
        self._addr = start_addr

    @staticmethod
    def _gen(addr: Addr) -> Iterator[Tuple[int, Callable[[int], List[int]]]]:
        idx = addr.addr
        while True:
            take = None

            def take_func(x):
                nonlocal take
                if take is None:
                    take = x
                    return ROM[idx + 1 : idx + x + 1]
                else:
                    raise Exception("Cannot call this function twice in a row!")

            yield ROM[idx], take_func

            idx += 1 + (0 if take is None else take)

    @staticmethod
    def _inner(start_addr):
        for ch, take in SbString._gen(start_addr):
            match ch:
                case 0x00:
                    # wait for key input and return
                    return
                case 0x01:
                    # set new position on screen
                    [pl, ph] = take(2)
                case 0x02:
                    # quick print certain text
                    [idx] = take(1)
                    match idx:
                        case 0:
                            yield "PLAYER"
                        case 1:
                            yield "ENEMY"
                        case 2:
                            yield "HANS WURST"  # Player name
                        case 3:
                            yield "HANS WUR"  # Player name but reduced to 8 chars
                        case 4:
                            yield "\u258C" * 4  # health bar
                        case x:
                            raise Exception(f"Invalid index for opcode 2: {x:X}")
                case 0x03:
                    # text color modifier
                    [color] = take(1)
                case 0x04:
                    # print health bar
                    # a is the pointer to the current health
                    # b is the pointer to the max health
                    [al, ah, bl, bh] = take(4)

                    pass
                case 0x05:
                    # do a lookup into a table
                    [bl, bh, a1, a2] = take(4)
                    # addr and size
                    known_luts = {
                        # character names
                        0xD2E6: 0x34,
                        # item names
                        0xCF74: 0x40,
                        0xD13B: 0x40,
                        # location names
                        0xC7C2: 0x80,
                    }

                    known_luts_hirom = {
                        # section names
                        0xC994: 0x80,
                    }

                    lut_addr = bh << 8 | bl
                    hirom = False
                    if lut_addr not in known_luts:
                        if lut_addr in known_luts_hirom:
                            hirom = True
                        else:
                            raise Exception(f"Unsupported LUT @ {lut_addr:04X}")

                    if hirom:
                        random_id = random.randint(0, known_luts_hirom[lut_addr])
                    else:
                        random_id = random.randint(0, known_luts[lut_addr])
                    name_ptr = IdaAddr(bank=0xC2, offset=lut_addr) + random_id * 2
                    addr_value = ROM[name_ptr] | ROM[name_ptr + 1] << 8
                    name_addr = IdaAddr(
                        bank=0x82,
                        offset=addr_value,
                    ).addr

                    while ROM[name_addr] != 0:
                        val = ROM[name_addr]
                        if val == 0x14:
                            name_addr += 1
                            n = ROM[name_addr]
                            yield from map(lambda _: "␣", range(n))
                        else:
                            yield SbChar(ROM[name_addr]).get()
                        name_addr += 1

                case 0x06:
                    # display dec value from memory
                    [width, ptr_lo, ptr_hi] = take(3)

                case 0x07:
                    # TODO draw textbox
                    [width, height] = take(2)
                    pass
                case 0x08:
                    # clear textbox
                    [px, py] = take(2)
                case 0x09:
                    # toggle cursive mode
                    pass
                case 0x0A:
                    pass
                case 0x0B:
                    # repeat `a` n times, where n is read from b
                    [a, bl, bh] = take(3)
                    assert (0x0D, 0xC7) == (bl, bh)
                    # 0xC70D is 0x19
                    yield from map(lambda _: a, range(0x19))
                case 0x0C:
                    # return and store current text pointer to $03F3
                    return
                case 0x0D:
                    yield "\n"
                case 0x0E:
                    [no_frames] = take(1)
                    # wait for `no_frames`
                case 0x0F:
                    # something with menu beep?!
                    pass
                case 0x10:
                    pass
                case 0x11:
                    # wait for keypress to advance and go to next line
                    yield SbChar(0x3D).get()
                    yield "\n"
                case 0x12:
                    # wait for any key input
                    pass
                case 0x13:
                    # load new textpointer
                    [bl, bh] = take(2)
                    # addr = Addr(start_addr)
                    addr_value = bh << 8 | bl
                    yield from SbString._inner(
                        IdaAddr(bank=start_addr.ida_bank, offset=addr_value)
                    )
                    return
                case 0x14:
                    # write space n times
                    [n] = take(1)
                    yield from map(lambda _: "␣", range(n))
                case 0x20:
                    yield '␣'
                case x:
                    yield SbChar(x).get()

    def print(self):
        t = []
        if self._addr.ida_bank == 0x82:
            text = "".join(self.interpret2())
        else:
            text = "".join(self.interpretX())

        print(text)

    def interpretX(self) -> Iterator[str]:
        skip = 0
        match ROM[self._addr.addr]:
            case 0x01:
                # continue on old position
                # TODO use X as textpointer
                pass
            case 0x10:
                # TODO draw textbox
                pass
            case _:
                # TODO restore "old" text pointer, speed, print a newline and go on
                pass

        yield from self._inner(self._addr + skip)

    def interpret2(self) -> Iterator[str]:
        yield from self._inner(self._addr)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--rom-image", required=False)
    parser.add_argument("addresses", metavar="A", type=str, nargs="*")

    args = parser.parse_args()

    if args.rom_image is not None:
        ROM.ROM_IMAGE_PATH = args.rom_image
    if len(args.addresses) == 0:
        args.addresses = [".C3:9fd0"]

    for addr in args.addresses:
        SbString(IdaAddr(addr)).print()
        print()
