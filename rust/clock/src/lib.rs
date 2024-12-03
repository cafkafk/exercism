use std::fmt;

#[derive(PartialEq, Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Self { hours, minutes }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self {
            hours: self.hours,
            minutes: self.minutes + minutes,
        }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:0>2.}:{:0>2.}", self.hours, self.minutes)
    }
}
