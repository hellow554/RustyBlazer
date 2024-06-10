use asar_text::{Translator, TranspileResult};
use std::borrow::Cow;

pub fn run_test(content: &str) -> TranspileResult {
    Translator::transpile("a.asm", content).unwrap()
}

#[track_caller]
pub fn assert_simple(content: &str, expected: &str) {
    let res = run_test(content);
    assert_eq!(res.inc_paths, Vec::<Cow<str>>::new());
    if let Some(res) = res.transpiled {
        assert_eq!(expected, res.join("\n"));
    } else {
        assert_eq!(content, expected);
    }
}
