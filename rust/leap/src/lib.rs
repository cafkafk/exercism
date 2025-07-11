// ## Introduction
//
// A leap year (in the Gregorian calendar) occurs:
//
// - In every year that is evenly divisible by 4.
// - Unless the year is evenly divisible by 100, in which case it's only a leap
// year if the year is also evenly divisible by 400.
//
// Some examples:
//
// - 1997 was not a leap year as it's not divisible by 4.
// - 1900 was not a leap year as it's not divisible by 400.
// - 2000 was a leap year!
//
// ~~~~exercism/note
// For a delightful, four-minute explanation of the whole phenomenon of leap years, check out [this YouTube video](https://www.youtube.com/watch?v=xX96xng7sAE).
// ~~~~
//
// ## Instructions
//
// Your task is to determine whether a given year is a leap year.
//
// You may use the [`arithmetic remainder`
// operator](https://doc.rust-lang.org/book/appendix-02-operators.html) to test
// for divisibility.

// failures:
//     year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year
//     year_divisible_by_100_not_divisible_by_400_in_common_year
//     year_divisible_by_200_not_divisible_by_400_in_common_year

pub fn is_leap_year(year: u64) -> bool {
    match year % 4 {
        0 if year % 100 != 0 => true,
        0 if year % 100 == 0 && year % 400 == 0 => true,
        _ => false,
    }
}
