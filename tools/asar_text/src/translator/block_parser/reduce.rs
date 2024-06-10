use itertools::Itertools;

use super::Value;

impl super::CurrentBlock<'_> {
    fn reduce_line(vals: &[Value]) -> String {
        vals.iter().join(" : ")
    }

    pub(super) fn reduce(&self) -> String {
        self.line_values
            .iter()
            .map(|vs| Self::reduce_line(vs))
            .join("\n")
    }
}
