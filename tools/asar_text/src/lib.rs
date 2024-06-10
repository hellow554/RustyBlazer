#![feature(array_try_map)]
#![allow(dead_code)]

mod error;
mod translator;

pub use error::*;
pub use translator::{Translator, TranspileResult};
