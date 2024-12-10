// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven() -> Int {
  40
}

// Please define the remaining_minutes_in_oven function
pub fn remaining_minutes_in_oven(n: Int) -> Int {
  expected_minutes_in_oven() - n
}

// Please define the preparation_time_in_minutes function
pub fn preparation_time_in_minutes(n: Int) -> Int {
  n * 2
}

// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(x: Int, y: Int) -> Int {
  preparation_time_in_minutes(x)
  + { expected_minutes_in_oven() - remaining_minutes_in_oven(y) }
}

// Please define the alarm function
pub fn alarm() -> String {
  "Ding!"
}
