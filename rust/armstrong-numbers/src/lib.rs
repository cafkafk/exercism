pub fn is_armstrong_number(num: u32) -> bool {
    if num == 0 {
        return true;
    }

    let pow: u32 = num
        .to_string()
        .len()
        .try_into()
        .expect("Failed to turn {num} length into u32");

    let binding = num.to_string();
    let series: u32 = binding
        .split("")
        .skip(1)
        .collect::<Vec<_>>()
        .into_iter()
        .filter(|x| !x.is_empty())
        .map(|x| {
            println!("{x}",);
            let n = x
                .parse::<u32>()
                .expect(&format!("{x:#?} failed").to_string());
            n.pow(pow)
        })
        .sum();

    // let res = series.map(|x| x)

    println!("Result: {series:?}");

    num == series
}
