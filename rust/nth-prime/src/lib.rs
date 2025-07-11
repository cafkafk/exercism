// Given a number n, determine what the nth prime is.
//
// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
// that the 6th prime is 13.
//
// If your language provides methods in the standard library to deal with prime
// numbers, pretend they don't exist and implement them yourself.
//
// Remember that while people commonly count with 1-based indexing (i.e. "the
// 6th prime is 13"), many programming languages, including Rust, use 0-based
// indexing (i.e. `primes[5] == 13`). Use 0-based indexing for your
// implementation.

fn is_prime(n: u32) -> bool {
    if n < 2 {
        return false;
    }
    let limit = (n as f64).sqrt() as u32;
    for i in 2..=limit {
        if n % i == 0 {
            return false;
        }
    }
    true
}

pub fn nth(n: u32) -> u32 {
    (2..)
        .filter(|&candidate| is_prime(candidate))
        .nth(n as usize)
        .unwrap()
}
