use std::io;

use snafu::prelude::*;

pub type Result<T = (), E = Error> = ::std::result::Result<T, E>;

#[derive(Debug, Snafu)]
#[snafu(visibility(pub(crate)))]
pub enum Error {
    #[snafu(display("{file}:{line} : {source}"))]
    Parse {
        file: String,
        line: usize,
        source: ParseError,
    },
    #[snafu(display("IO Error occured while processing `{path}`: {source}"))]
    Io { source: io::Error, path: String },
}

#[derive(Debug, Snafu)]
#[snafu(visibility(pub(crate)))]
pub enum ParseError {
    #[snafu(display("@END@ without begin"))]
    EndWithoutBegin,
    #[snafu(display("Multiple begins detected"))]
    MultipleBegins,
    #[snafu(display("Can't translate `{what}` to something useful"))]
    TranslateError { what: String },
    #[snafu(display("Unknown escape sequence \\`{what}`"))]
    UnknownEscapeSequence { what: String },
    #[snafu(display("Unfinished Escape sequence. If you happened to print a `\\`, use a double backslash `\\\\`"))]
    UnfinishedEscapeSequence,
    #[snafu(display("I don't know what `{what}` is"))]
    UnknownKeyword { what: String },
    #[snafu(display("`{what}` is not supported. Please delete it"))]
    UnsupportedContent { what: String },
    #[snafu(display("The quote is not properly closed"))]
    UnclosedQuote,
    #[snafu(display("value {value:#x} exceeds maximum value of {max_value:#x}"))]
    InvalidWidth { value: i64, max_value: i64 },
    #[snafu(display("Expected {expected_args} arguments, but only could get {actual_args}"))]
    ArgsNumberDiffer {
        expected_args: usize,
        actual_args: usize,
    },
    #[snafu(display("Expected more text to follow, but got no more"))]
    UnexpectedEof,
    #[snafu(display("Expected a hex string, but got {what}"))]
    InvalidHexDigit { what: String },
}
