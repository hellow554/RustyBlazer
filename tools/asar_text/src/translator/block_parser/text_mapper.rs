use std::ops::Not;
use std::sync::LazyLock;

use itertools::Itertools;
use regex::Regex;
use snafu::{ensure, OptionExt};

use super::{lut::LUT, Result, Value};
use crate::error::{
    InvalidHexDigitSnafu, UnexpectedEofSnafu, UnfinishedEscapeSequenceSnafu,
    UnknownEscapeSequenceSnafu,
};

static SPLIT_REGEX: LazyLock<Regex> = LazyLock::new(|| Regex::new("( |,|\\.|«|»)").unwrap());

struct SpaceCounter {
    space_counter: usize,
}

impl SpaceCounter {
    const fn new() -> Self {
        Self { space_counter: 0 }
    }

    fn proc_char(&mut self, c: char) {
        if self.space_counter <= 2 {
            if c == ' ' {
                self.space_counter += 1;
            } else {
                self.space_counter = 0;
            }
        }
    }

    const fn need_repeat(&self) -> bool {
        self.space_counter > 2
    }
}

pub(super) struct TextTranslator<'a> {
    values: Vec<Value<'a>>,
    needs_space: bool,
    escape_start: bool,
    space_counter: SpaceCounter,
}

impl<'v> TextTranslator<'v> {
    const fn new() -> Self {
        Self {
            values: vec![],
            needs_space: false,
            escape_start: false,
            space_counter: SpaceCounter::new(),
        }
    }

    fn process_word(&mut self, word: &str) -> Result {
        if word.is_empty() {
            return Ok(());
        }

        self.space_counter
            .proc_char(if word == " " { ' ' } else { 'x' });
        if std::mem::take(&mut self.needs_space) {
            if word == " " {
                return Ok(());
            }

            // we needed a space, but we got none
            let Some(Value::Byte(lut_idx)) = self.values.pop() else {
                unreachable!("This would be a logic error");
            };
            self.values
                .extend(LUT[usize::from(lut_idx - 0x80)].chars().map(Value::Char));
        }

        if let Some(pos) = LUT.iter().position(|x| x == &word) {
            self.values.push(Value::Byte(pos as u8 + 0x80));
            self.needs_space = true;
        } else {
            self.escape_start = false;
            let mut chars = word.chars();
            while let Some(c) = chars.next() {
                if self.escape_start {
                    if c == 'x' {
                        let hi = chars.next().context(UnexpectedEofSnafu)?;
                        let hi = hi.to_digit(16).context(InvalidHexDigitSnafu { what: hi })?;
                        let lo = chars.next().context(UnexpectedEofSnafu)?;
                        let lo = lo.to_digit(16).context(InvalidHexDigitSnafu { what: lo })?;

                        // it's not possible that this overflows, because we have two nibbles that get's converted into a byte
                        #[allow(clippy::cast_possible_truncation)]
                        self.values.push(Value::Byte(((hi << 4) | lo) as u8));
                    } else if c == 'n' {
                        self.values.push(Value::Byte(0x0D));
                    } else if c == '0' {
                        self.values.push(Value::Byte(0));
                    } else if c == '\\' || c == '"' {
                        self.values.push(Value::Char(c));
                    } else {
                        return UnknownEscapeSequenceSnafu { what: c }.fail();
                    }
                    self.escape_start = false;
                } else if c == '\\' {
                    self.escape_start = true;
                } else {
                    self.values.push(Value::Char(c));
                }
            }
        }

        Ok(())
    }

    pub(super) fn map(txt: &'v str) -> Result<Vec<Value<'v>>> {
        let mut tt = Self::new();
        let mut last_idx = 0;
        for mat in SPLIT_REGEX.find_iter(txt) {
            tt.process_word(&txt[last_idx..mat.start()])?;
            tt.process_word(&txt[mat.range()])?;
            last_idx = mat.end();
        }

        if txt[last_idx..].is_empty().not() {
            tt.process_word(&txt[last_idx..])?;
        }

        ensure!(tt.escape_start.not(), UnfinishedEscapeSequenceSnafu);

        if tt.needs_space {
            // we needed a space, but we got none
            let Some(Value::Byte(lut_idx)) = tt.values.pop() else {
                unreachable!("This would be a logic error");
            };
            tt.values
                .extend(LUT[usize::from(lut_idx - 0x80)].chars().map(Value::Char));
        }

        Ok(if tt.space_counter.need_repeat() {
            tt.convert_consecutive_spaces()
        } else {
            tt.values
        })
    }

    fn convert_consecutive_spaces(self) -> Vec<Value<'v>> {
        self.values
            .into_iter()
            .chunk_by(|a| &Value::Char(' ') == a)
            .into_iter()
            .flat_map(|(key, chunk)| {
                if key {
                    let len = chunk.count();
                    assert!(len < 256, "Watafaq");

                    if len > 2 {
                        vec![Value::Multiple(vec![
                            Value::Byte(0x14),
                            Value::Byte(len as u8),
                        ])]
                    } else {
                        (0..len).map(|_| Value::Char(' ')).collect()
                    }
                } else {
                    chunk.collect()
                }
            })
            .collect()
    }
}
