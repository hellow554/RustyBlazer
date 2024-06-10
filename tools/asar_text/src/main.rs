#![feature(array_try_map)]
#![allow(dead_code)]

mod error;
mod translator;

use std::{
    fs::File,
    io::{Seek, Write},
    path::Path,
    process::ExitCode,
};

use error::*;
use snafu::{ErrorCompat, ResultExt};
use translator::Translator;

fn crawl(path: &Path) -> Result {
    let mut next_paths = vec![path.to_owned()];

    while let Some(path) = next_paths.pop() {
        let snafu = IoSnafu {
            path: path.to_string_lossy(),
        };

        let mut file = File::options()
            .read(true)
            .write(true)
            .create(false)
            .open(&path)
            .context(snafu.clone())?;

        let content = std::io::read_to_string(&file).context(snafu.clone())?;

        let translator =
            Translator::transpile(path.file_name().unwrap().to_str().unwrap(), &content)?;

        if let Some(new_content) = translator.transpiled {
            // truncate the file and set the pointer to the start of the file
            file.set_len(0)
                .and_then(|_| file.seek(std::io::SeekFrom::Start(0)))
                .and_then(|_| file.write_all(new_content.join("\n").as_bytes()))
                .and_then(|_| file.write_all(b"\n"))
                .context(snafu)?;
        }

        let parent_path = path.parent().unwrap();
        next_paths.extend(
            translator
                .inc_paths
                .into_iter()
                .rev()
                .map(|p| parent_path.join(&*p)),
        );
    }

    Ok(())
}

fn main() -> ExitCode {
    let fname = std::env::args()
        .nth(1)
        .expect("Provide the file to transpile as the only argument");

    if let Err(e) = crawl(Path::new(&fname)) {
        eprintln!("An error occured: {e}");
        if let Some(bt) = ErrorCompat::backtrace(&e) {
            eprintln!("{bt}");
        }
        ExitCode::FAILURE
    } else {
        ExitCode::SUCCESS
    }
}
