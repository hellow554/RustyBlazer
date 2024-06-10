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
    let mut todo = vec![path.to_owned()];

    while let Some(path) = todo.pop() {
        let mut file = File::options()
            .read(true)
            .write(true)
            .create(false)
            .open(&path)
            .context(IoSnafu {
                path: path.to_string_lossy(),
            })?;

        let content = std::io::read_to_string(&file).context(IoSnafu {
            path: path.to_str().unwrap(),
        })?;

        let translator =
            Translator::transpile(path.file_name().unwrap().to_str().unwrap(), &content)?;

        if let Some(new_content) = translator.transpiled {
            // truncate the file and set the pointer to the start of the file
            file.set_len(0).context(IoSnafu {
                path: path.to_string_lossy(),
            })?;
            file.seek(std::io::SeekFrom::Start(0)).context(IoSnafu {
                path: path.to_string_lossy(),
            })?;
            file.write_all(new_content.join("\n").as_bytes())
                .context(IoSnafu {
                    path: path.to_string_lossy(),
                })?;
        }

        let parent_path = path.parent().unwrap();
        todo.extend(
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
