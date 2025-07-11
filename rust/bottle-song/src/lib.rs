// ## Instructions
//
// Recite the lyrics to that popular children's repetitive song: Ten Green Bottles.
//
// Note that not all verses are identical.
//
// ```text
// Ten green bottles hanging on the wall,
// Ten green bottles hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be nine green bottles hanging on the wall.
//
// Nine green bottles hanging on the wall,
// Nine green bottles hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be eight green bottles hanging on the wall.
//
// Eight green bottles hanging on the wall,
// Eight green bottles hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be seven green bottles hanging on the wall.
//
// Seven green bottles hanging on the wall,
// Seven green bottles hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be six green bottles hanging on the wall.
//
// Six green bottles hanging on the wall,
// Six green bottles hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be five green bottles hanging on the wall.
//
// Five green bottles hanging on the wall,
// Five green bottles hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be four green bottles hanging on the wall.
//
// Four green bottles hanging on the wall,
// Four green bottles hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be three green bottles hanging on the wall.
//
// Three green bottles hanging on the wall,
// Three green bottles hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be two green bottles hanging on the wall.
//
// Two green bottles hanging on the wall,
// Two green bottles hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be one green bottle hanging on the wall.
//
// One green bottle hanging on the wall,
// One green bottle hanging on the wall,
// And if one green bottle should accidentally fall,
// There'll be no green bottles hanging on the wall.
// ```

pub fn recite(start_bottles: u32, take_down: u32) -> String {
    let mut count = start_bottles;
    let mut verse = "".to_string();
    while count >= 1 {
        let count_word = count.to_word();
        let count_next = count - 1;
        let count_next_word = count_next.to_word();
        let bottle_word = count.to_bottle_word();
        let bottle_next_word = count_next.to_bottle_word();
        verse = format!(
            "{verse}{}{}{}{}",
            format!("{count_word} green {bottle_word} hanging on the wall,\n"),
            format!("{count_word} green {bottle_word} hanging on the wall,\n"),
            format!(
                "And if {} green {bottle_word} should accidentally fall,\n",
                count_word.to_lowercase()
            ),
            format!(
                "There'll be {} green {bottle_next_word} hanging on the wall.\n\n",
                count_next_word.to_lowercase()
            )
        );
        count = count - take_down;
    }
    verse.into()
}

trait ToWord {
    fn to_word(&self) -> &str;
}

trait ToBottleWord {
    fn to_bottle_word(&self) -> &str;
}

impl ToWord for u32 {
    fn to_word(&self) -> &str {
        match *self {
            0 => "No",
            1 => "One",
            2 => "Two",
            3 => "Three",
            4 => "Four",
            5 => "Zero",
            6 => "One",
            7 => "Two",
            8 => "Three",
            9 => "Four",
            _ => todo!("Onlyy knows numbers 0-9"),
        }
    }
}

impl ToBottleWord for u32 {
    fn to_bottle_word(&self) -> &str {
        match *self {
            1 => "bottle",
            _ => "bottles",
        }
    }
}
