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
    (0..take_down)
        .map(|i| verse(start_bottles - i))
        .collect::<Vec<String>>()
        .join("\n\n")
}

fn verse(n: u32) -> String {
    format!(
        "{current_num_str} green {current_bottle_str} hanging on the wall,\n\
         {current_num_str} green {current_bottle_str} hanging on the wall,\n\
         And if one green bottle should accidentally fall,\n\
         There'll be {next_num_str} green {next_bottle_str} hanging on the wall.",
        current_num_str = n.to_word(),
        current_bottle_str = n.to_bottle_word(),
        next_num_str = (n - 1).to_word().to_lowercase(),
        next_bottle_str = (n - 1).to_bottle_word()
    )
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
            5 => "Five",
            6 => "Six",
            7 => "Seven",
            8 => "Eight",
            9 => "Nine",
            10 => "Ten",
            _ => "Only knows numbers 0-10",
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
