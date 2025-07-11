// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

// Given an age in seconds, calculate how old someone would be on a planet in our Solar System.
//
// One Earth year equals 365.25 Earth days, or 31,557,600 seconds.
// If you were told someone was 1,000,000,000 seconds old, their age would be 31.69 Earth-years.
//
// For the other planets, you have to account for their orbital period in Earth Years:
//
// | Planet  | Orbital period in Earth Years |
// | ------- | ----------------------------- |
// | Mercury | 0.2408467                     |
// | Venus   | 0.61519726                    |
// | Earth   | 1.0                           |
// | Mars    | 1.8808158                     |
// | Jupiter | 11.862615                     |
// | Saturn  | 29.447498                     |
// | Uranus  | 84.016846                     |
// | Neptune | 164.79132                     |
//
// ~~~~exercism/note
// The actual length of one complete orbit of the Earth around the sun is closer to 365.256 days (1 sidereal year).
// The Gregorian calendar has, on average, 365.2425 days.
// While not entirely accurate, 365.25 is the value used in this exercise.
// See [Year on Wikipedia][year] for more ways to measure a year.
//
// [year]: https://en.wikipedia.org/wiki/Year#Summary
// ~~~~

#[derive(Debug)]
pub struct Duration {
    pub value: f64,
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Self { value: s as f64 }
    }
}

pub trait Planet {
    const EARTH_YEAR_SECONDS: f64 = 31557600.0;
    const EARTH_YEAR_RATIO: f64;
    fn years_during(d: &Duration) -> f64 {
        d.value / Self::EARTH_YEAR_SECONDS / Self::EARTH_YEAR_RATIO
    }
}

macro_rules! boilerplate {
    ($($t:ident => $e:expr)+) => {
        $(
            pub struct $t {}
            impl Planet for $t {
                const EARTH_YEAR_RATIO: f64 = $e;
            }
        )*
    }
}

boilerplate! {
    Mercury => 0.2408467
    Venus   => 0.61519726
    Earth   => 1.0
    Mars    => 1.8808158
    Jupiter => 11.862615
    Saturn  => 29.447498
    Uranus  => 84.016846
    Neptune => 164.79132
}
