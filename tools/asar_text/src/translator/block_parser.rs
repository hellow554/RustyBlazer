mod lut;
mod parse_comment;
mod reduce;
mod text_mapper;

use itertools::Itertools;

use super::{Result, Value};

#[derive(Debug)]
pub(super) struct CurrentBlock<'a> {
    line: &'a str,
    bold_status: bool,
    line_values: Vec<Vec<Value<'a>>>,
    auto_newline: bool,
}

impl<'a> CurrentBlock<'a> {
    pub const fn new() -> Self {
        Self {
            line: "",
            bold_status: false,
            line_values: vec![],
            auto_newline: false,
        }
    }

    pub fn chain_add(mut self, val: Value<'a>) -> Self {
        self.line_values.push(vec![val]);
        self
    }

    pub const fn enable_autonewline(mut self) -> Self {
        self.auto_newline = true;
        self
    }

    pub fn parse_comment(&mut self, content: &'a str) -> Result {
        self.line = content;
        self.line_values.push(vec![]);

        self.do_parse_comment()
    }

    pub fn add_newline(&mut self) {
        // due to a bug in asar, we cannot use '\n'
        self.merge_add(Value::Byte(0x0D));
    }

    pub fn add_to_current_line(&mut self, val: Value<'a>) {
        self.merge_add(val);
    }

    pub fn extend_to_current_line(&mut self, iter: impl IntoIterator<Item = Value<'a>>) {
        for i in iter {
            self.merge_add(i);
        }
    }

    fn merge_add(&mut self, val: Value<'a>) {
        let last_line = self.line_values.last_mut().unwrap();
        if let Some(last) = last_line.last_mut() {
            if let Value::Multiple(multi) = last {
                assert!(!multi.is_empty(), "LOGIC ERROR! MULTI SHOULD NOT BE EMPTY!");

                let last = multi.last_mut().unwrap();
                if last.prefix() == val.prefix() {
                    multi.push(val);
                } else {
                    last_line.push(val);
                }
            } else if last.prefix() == val.prefix() {
                let l = last_line.pop().unwrap();
                last_line.push(Value::Multiple(vec![l, val]));
            } else {
                last_line.push(val);
            }
        } else {
            last_line.push(val);
        }
    }

    fn sanity_check(&self) {
        for values in &self.line_values {
            assert!(
                !values.is_empty(),
                "LOGIC ERROR! DETECTED EMPTY LINE VALUE!"
            );
            for line in values {
                if let Value::Multiple(vec) = line {
                    assert!(
                        vec.iter().unique_by(std::mem::discriminant).count() == 1,
                        "LOGIC ERROR! MULTIPLE CONTAINS DIFFERENT VALUES!"
                    );
                }
            }
        }

        // todo: check u24s
    }

    pub fn to_asar_text(&self) -> String {
        self.sanity_check();
        self.reduce()
    }
}
