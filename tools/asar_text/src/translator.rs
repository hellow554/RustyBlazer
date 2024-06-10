mod block_parser;

use block_parser::CurrentBlock;
use itertools::Itertools;
use regex::{Match, Regex};
use snafu::{ensure, ResultExt};

use std::{borrow::Cow, fmt, sync::LazyLock};

use crate::error::*;

type Result<T = (), E = ParseError> = ::std::result::Result<T, E>;

macro_rules! new_regex {
    ($($name: ident => $regex: expr),+ $(,)?) => {
        $(
            static $name: LazyLock<Regex> = LazyLock::new(|| Regex::new($regex).unwrap());
        )*
    };
}

new_regex!(
    DEFAULT_START_BLOCK => r"^;\s*@DEFAULT_TEXTBOX@$",
    NEW_BLOCK => r"^;\s*@NEW_TEXT@$",
    ENDBLOCK => r"^;\s*@END@$",
    ENDSTRING => r"^;\s*@ENDSTRING@$",
    INCSTMT => r#"^incsrc\s*"([^"]+)"$"#,
    SINGLE_STRING => r";\s*@STRING@ ",
);

#[derive(Debug, Default)]
pub struct TranspileResult<'a> {
    pub inc_paths: Vec<Cow<'a, str>>,
    pub transpiled: Option<Vec<Cow<'a, str>>>,
}

#[derive(Debug, PartialEq, Eq)]
pub enum DataWidth {
    Byte,
    Word,
    Long,
    DWord,
}

impl DataWidth {
    fn prefix(&self) -> &'static str {
        match self {
            DataWidth::Byte => "db",
            DataWidth::Word => "dw",
            DataWidth::Long => "dl",
            DataWidth::DWord => "dd",
        }
    }
}

#[derive(Debug, PartialEq, Eq)]
enum Value<'a> {
    Byte(u8),
    Word(u16),
    Long(/*u24*/ u32),
    DWord(u32),
    Char(char),
    String(Cow<'a, str>),
    Label(Cow<'a, str>, Option<DataWidth>),
    Multiple(Vec<Value<'a>>),
}

impl Value<'_> {
    fn prefix(&self) -> &'static str {
        match self {
            Value::Byte(_) | Value::Char(_) | Value::String(_) => "db",
            Value::Word(_) => "dw",
            Value::Long(_) => "dl",
            Value::DWord(_) => "dd",
            Value::Label(_, Some(dw)) => dw.prefix(),
            Value::Label(_, None) => "",
            Value::Multiple(m) => m.first().unwrap().prefix(),
        }
    }

    fn format_value(&self) -> String {
        match self {
            Value::Byte(b) => format!("${b:02X}"),
            Value::Word(w) => format!("${w:04X}"),
            Value::Long(l) => format!("${l:06X}"),
            Value::DWord(d) => format!("${d:08X}"),
            Value::Char(c) => format!("'{c}'"),
            Value::String(s) => format!("\"{s}\""),
            Value::Label(l, _) => format!("{l}"),
            Value::Multiple(m) => m.iter().map(Value::format_value).join(","),
        }
    }
}

impl fmt::Display for Value<'_> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{} {}", self.prefix(), self.format_value())
    }
}

#[derive(Debug, Default)]
pub struct Translator<'a> {
    need_rewrite: bool,
    current_block: Option<CurrentBlock<'a>>,

    inc_paths: Vec<Cow<'a, str>>,
}

#[derive(Debug)]
enum StringOutput<'a> {
    Existing,
    Skip,
    New(Cow<'a, str>),
}

impl<'a> Translator<'a> {
    pub fn transpile(filename: &str, content: &'a str) -> Result<TranspileResult<'a>, Error> {
        let mut translator = Translator::default();
        let mut output = vec![];
        let mut modified = false;

        for (line_num, line) in content.lines().enumerate() {
            let so = translator.process_line(line).context(ParseSnafu {
                file: filename,
                line: line_num + 1,
            })?;
            match so {
                StringOutput::Existing => output.push(line.into()),
                StringOutput::Skip => (),
                StringOutput::New(new) => {
                    modified = true;
                    output.push(new);
                }
            }
        }

        Ok(TranspileResult {
            inc_paths: translator.inc_paths,
            transpiled: modified.then_some(output),
        })
    }

    fn process_line(&mut self, line: &'a str) -> Result<StringOutput<'a>> {
        // we could optimize things here by checking whether the line contains any `;`
        // or if we are inside a block right now, but that only brings us ~5ms on our
        // current codebase. So let's do not overcomplicate it
        let line = line.trim();
        if DEFAULT_START_BLOCK.is_match(line) {
            ensure!(self.current_block.is_none(), MultipleBeginsSnafu);
            self.current_block = Some(
                CurrentBlock::new()
                    .enable_autonewline()
                    .chain_add(Value::Byte(0x10)),
            );
        } else if NEW_BLOCK.is_match(line) {
            ensure!(self.current_block.is_none(), MultipleBeginsSnafu);
            self.current_block = Some(CurrentBlock::new().enable_autonewline());
        } else if ENDBLOCK.is_match(line) {
            return self.end_block(line, false);
        } else if ENDSTRING.is_match(line) {
            return self.end_block(line, true);
        } else if let Some(cap) = INCSTMT.captures(line) {
            let m = cap.get(1).unwrap();
            self.inc_paths.push(Cow::Borrowed(&line[m.range()]));
        } else if let Some(mat) = SINGLE_STRING.find(line) {
            ensure!(self.current_block.is_none(), MultipleBeginsSnafu);
            self.current_block = Some(CurrentBlock::new());
            return self.single_string(line, mat);
        } else if let Some(cb) = self.current_block.as_mut() {
            if line.starts_with(";;") {
                // this is a comment inside a comment, let's ignore, but not delete it
            } else if let Some(rest) = line.strip_prefix(";") {
                cb.parse_comment(rest)?;
            } else {
                return Ok(StringOutput::Skip);
            }
        }

        Ok(StringOutput::Existing)
    }

    fn end_block(&mut self, current_line: &str, append_null: bool) -> Result<StringOutput<'a>> {
        ensure!(self.current_block.is_some(), EndWithoutBeginSnafu);
        self.need_rewrite = true;

        let x = if append_null {
            self.current_block
                .take()
                .unwrap()
                .chain_add(Value::Byte(0x00))
                .to_asar_text()
        } else {
            self.current_block.take().unwrap().to_asar_text()
        };

        Ok(StringOutput::New(Cow::Owned(format!(
            "{x}\n{current_line}"
        ))))
    }

    fn single_string(&mut self, line: &str, mat: Match) -> Result<StringOutput<'a>> {
        ensure!(self.current_block.is_some(), EndWithoutBeginSnafu);
        let mut cb = self.current_block.take().unwrap();

        let comment = &line[mat.end()..];

        cb.parse_comment(comment.trim())?;
        cb.add_to_current_line(Value::Byte(0));

        Ok(StringOutput::New(Cow::Owned(format!(
            "{} {}",
            cb.to_asar_text(),
            &line[mat.start()..]
        ))))
    }
}
