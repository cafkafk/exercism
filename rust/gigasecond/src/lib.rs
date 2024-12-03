use std::ops::Add;
use time::PrimitiveDateTime as DateTime;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    DateTime::add(start, time::Duration::seconds(1000000000))
}
