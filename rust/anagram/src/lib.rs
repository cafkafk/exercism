use std::collections::HashSet;

fn sort_word(word: &str) -> Vec<char> {
    let mut chars: Vec<char> = word.to_lowercase().chars().collect();
    chars.sort_unstable();
    chars
}

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let lower_word = word.to_lowercase();
    let sorted_word = sort_word(word);

    possible_anagrams
        .iter()
        .filter(|candidate| {
            let lower_candidate = candidate.to_lowercase();
            lower_candidate.len() == lower_word.len()
                && lower_candidate != lower_word
                && sort_word(candidate) == sorted_word
        })
        .copied()
        .collect()
}
