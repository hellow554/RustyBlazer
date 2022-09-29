#!/usr/bin/env python3

import csv
import re
import sys

LABEL_RE = re.compile("^(?P<bank>[0-9a-fA-F]+):(?P<addr>[0-9a-fA-F]+) (?P<global>Abs)? +(?P<label>\w+)$")


def calc_real_addr(bank: int, addr: int) -> int:
    if bank < 0x7E000:
        return bank * 0x10 + addr
    elif bank == 0x7E000:
        return 0x10000 + addr
    else:
        bank = bank + 0x210 - 0x80000
        return bank * 0x10 + addr


def main():
    labels = []
    with open("/mnt/d/kk/exp_diz/ida_labels.csv", "w") as csv_file:
        writer = csv.writer(csv_file)
        with open("/mnt/d/kk/exp/Soul Blazer (USA).sfc.map", "r") as map_file:
            for line in map_file:
                matches = LABEL_RE.search(line.strip())
                if matches:
                    real_addr = calc_real_addr(int(matches["bank"], 16), int(matches["addr"], 16))
                    prefix = "" #if matches["global"] else "."
                    label = matches["label"]
                    writer.writerow((f"{real_addr:06X}", f"{prefix}{label}", ""))


if __name__ == "__main__":
    main()
