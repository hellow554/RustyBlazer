use std::{borrow::Cow, iter::Peekable};

use snafu::OptionExt;

use crate::{
    translator::{DataWidth, Value},
    ArgsNumberDifferSnafu, UnclosedQuoteSnafu, UnknownKeywordSnafu,
};

use super::{text_mapper::TextTranslator, Result};

fn find_matching_close(mut s: &str) -> Option<usize> {
    while let Some(pos) = s.find('"') {
        if let Some("\\") = s.get(pos - 1..pos) {
            // quote is escaped, search the next one
            s = &s[pos..];
        } else {
            return Some(pos);
        }
    }
    None
}

#[derive(Debug)]
enum PossibleArgs<'a> {
    Quote(&'a str),
    Command(&'a str),
}

impl<'a> PossibleArgs<'a> {
    fn to_str(&self) -> &'a str {
        match self {
            PossibleArgs::Quote(a) | PossibleArgs::Command(a) => a,
        }
    }
}

struct ArgIterator<'a> {
    line: &'a str,
}

impl<'a> Iterator for ArgIterator<'a> {
    type Item = Result<PossibleArgs<'a>>;

    fn next(&mut self) -> Option<Self::Item> {
        if self.line.is_empty() {
            None
        } else {
            if self.line.starts_with(' ') {
                self.line = self.line.trim_start();
            }

            Some(Ok(if self.line.starts_with('*') {
                self.line = &self.line[1..];
                PossibleArgs::Command("*")
            } else if let Some(wo_quote) = self.line.strip_prefix('"') {
                let Some(end) = find_matching_close(wo_quote) else {
                    return Some(Err(UnclosedQuoteSnafu.build()));
                };
                let (ret, rest) = wo_quote.split_at(end);
                self.line = &rest[1..]; // don't include the trailing "
                PossibleArgs::Quote(ret)
            } else if let Some(space_pos) = self.line.find(' ') {
                let (ret, rest) = self.line.split_at(space_pos);
                self.line = &rest[1..]; // don't include the space
                PossibleArgs::Command(ret)
            } else {
                PossibleArgs::Command(std::mem::take(&mut self.line))
            }))
        }
    }
}

fn iter_args(line: &str) -> ArgIterator {
    ArgIterator { line: line.trim() }
}

type PeekIterator<'a> = Peekable<ArgIterator<'a>>;

fn get_args<'a, const N: usize>(it: &mut PeekIterator<'a>) -> Result<[&'a str; N]> {
    let mut n = 0_usize;
    [""; N].try_map(|_| {
        let x = it
            .next()
            .transpose()?
            .map(|s| s.to_str())
            .context(ArgsNumberDifferSnafu {
                expected_args: N,
                actual_args: n,
            });
        n += 1;
        x
    })
}

trait ParseAsarHex: Sized {
    fn parse_asar_hex(src: &str) -> Option<Self> {
        if let Some(src) = src.strip_prefix('$') {
            Self::parse_radix(src, 16)
        } else if let Some(src) = src.strip_prefix('%') {
            Self::parse_radix(src, 2)
        } else {
            Self::parse_radix(src, 10)
        }
    }
    fn parse_radix(src: &str, radix: u32) -> Option<Self>;
}

impl ParseAsarHex for u8 {
    fn parse_radix(src: &str, radix: u32) -> Option<Self> {
        Self::from_str_radix(src, radix).ok()
    }
}
impl ParseAsarHex for u16 {
    fn parse_radix(src: &str, radix: u32) -> Option<Self> {
        Self::from_str_radix(src, radix).ok()
    }
}
impl ParseAsarHex for u32 {
    fn parse_radix(src: &str, radix: u32) -> Option<Self> {
        Self::from_str_radix(src, radix).ok()
    }
}

fn get_args_and_map<'a, const N: usize, F: Fn(&str) -> Value>(
    it: &mut PeekIterator<'a>,
    f: F,
) -> Result<[Value<'a>; N]> {
    get_args::<N>(it).map(|s| s.map(f))
}

fn byte_or_label(s: &str) -> Value {
    u8::parse_asar_hex(s).map_or(Value::Label(Cow::Borrowed(s), Some(DataWidth::Byte)), |s| {
        Value::Byte(s)
    })
}

fn word_or_label(s: &str) -> Value {
    u16::parse_asar_hex(s).map_or(Value::Label(Cow::Borrowed(s), Some(DataWidth::Word)), |s| {
        Value::Word(s)
    })
}

impl<'a> super::CurrentBlock<'a> {
    fn eval_command(&mut self, cmd: &str, it: &mut PeekIterator<'a>) -> Result {
        match cmd {
            "NO_NEWLINE" => (/* NOP */),
            "SETPOS" => {
                let [x, y] = get_args_and_map(it, byte_or_label)?;
                self.extend_to_current_line([Value::Byte(0x01), x, y]);
            }
            "PLAYER" => self.extend_to_current_line([Value::Byte(0x02), Value::Byte(0x00)]),
            "ENEMY" => self.extend_to_current_line([Value::Byte(0x02), Value::Byte(0x01)]),
            "PLAYER_NAME" => self.extend_to_current_line([Value::Byte(0x02), Value::Byte(0x02)]),
            "PLAYER_NAME8" => self.extend_to_current_line([Value::Byte(0x02), Value::Byte(0x03)]),
            "BOLD" | "*" => {
                let peeked = it.peek();
                let val = if matches!(peeked, Some(Ok(PossibleArgs::Command("ON")))) {
                    it.next(); // eat the peeked value
                    self.bold_status = true;
                    0x24
                } else if matches!(peeked, Some(Ok(PossibleArgs::Command("OFF")))) {
                    it.next(); // eat the peeked value
                    self.bold_status = false;
                    0x20
                } else {
                    self.bold_status = !self.bold_status;
                    if self.bold_status {
                        0x24
                    } else {
                        0x20
                    }
                };

                self.extend_to_current_line([Value::Byte(0x03), Value::Byte(val)]);
            }
            "LOOKUP" => {
                let [table, offset] = get_args_and_map(it, word_or_label)?;
                self.extend_to_current_line([Value::Byte(0x05), table, offset]);
            }
            "DECVAL" => {
                //prints a decimal value @ address
                let [width, addr] = get_args(it)?;
                self.extend_to_current_line([
                    Value::Byte(0x06),
                    byte_or_label(width),
                    word_or_label(addr),
                ]);
            }
            "DRAWBOX" => {
                let [width, height] = get_args_and_map(it, byte_or_label)?;
                self.extend_to_current_line([Value::Byte(0x07), width, height]);
            }
            "CLEARBOX" => {
                let [width, height] = get_args_and_map(it, byte_or_label)?;
                self.extend_to_current_line([Value::Byte(0x08), width, height]);
            }
            "CURSIVE" => self.add_to_current_line(Value::Byte(0x09)),
            "REPEAT" => {
                let [amount, addr] = get_args(it)?;
                self.extend_to_current_line([
                    Value::Byte(0x0B),
                    byte_or_label(amount),
                    word_or_label(addr),
                ]);
            }
            "CONT" => self.add_to_current_line(Value::Byte(0x0C)),
            "NEWLINE" => self.add_newline(),
            "WAIT" => {
                let [amount] = get_args_and_map(it, byte_or_label)?;
                self.extend_to_current_line([Value::Byte(0x0E), amount]);
            }
            /* 0x10 is DEFAULT_START_BLOCK */
            "WFE" => self.add_to_current_line(Value::Byte(0x11)),
            "WFAK" => self.add_to_current_line(Value::Byte(0x12)),
            "->" => {
                let [target] = get_args_and_map(it, word_or_label)?;
                self.extend_to_current_line([Value::Byte(0x13), target]);
            }
            "SPACE" => {
                let [count] = get_args_and_map(it, byte_or_label)?;
                self.extend_to_current_line([Value::Byte(0x14), count]);
            }
            "LABEL" => {
                let [label] = get_args::<1>(it)?;
                self.add_to_current_line(Value::Label(Cow::Owned(format!("{label}:")), None));
            }
            _ => return Err(UnknownKeywordSnafu { what: cmd }.build()),
        }

        Ok(())
    }

    pub(super) fn do_parse_comment(&mut self) -> Result {
        let mut add_newline = false;
        let mut args_iter = iter_args(self.line).peekable();
        while let Some(arg) = args_iter.next() {
            add_newline = false;
            let arg = arg?;
            match arg {
                PossibleArgs::Quote(s) => {
                    self.extend_to_current_line(TextTranslator::map(s)?);
                    add_newline = true;
                }
                PossibleArgs::Command(cmd) => self.eval_command(cmd, args_iter.by_ref())?,
            }
        }

        if add_newline && self.auto_newline {
            self.add_newline();
        }

        Ok(())
    }
}
