pub fn reverse(input: &str) -> String {
    let mut input_vec = input.chars().collect::<Vec<char>>();
    input_vec.reverse();
    input_vec.into_iter().collect()
}
