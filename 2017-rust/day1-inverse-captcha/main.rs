use std::io::{self, Read};

fn main() {
    let mut args = std::env::args();
    args.next(); // use up $0
    let part = args.next().unwrap_or("1".to_string());

    match part.as_ref() {
        "1" => {
            let result = part1();
            match result {
                Ok(val) => println!("{}", val),
                Err(e) => panic!(e),
            }
        },
        "2" => {
            let result = part2();
            match result {
                Ok(val) => println!("{}", val),
                Err(e) => panic!(e),
            }
        },
        _ => {
            println!("found part: {}", part);
            panic!("unrecognized part");
        },
    }
}

fn part1() -> Result<u32, io::Error> {
    let stdin = io::stdin();

    let mut handle = stdin.lock();

    let mut buffer = String::new();
    handle.read_to_string(&mut buffer)?;

    let mut sum: u32 = 0;
    let mut chars = buffer.chars();
    let first_digit = chars.next().map(|d| d.to_digit(10));
    let mut prev_digit: u32;

    // first char
    match first_digit {
        None    => return Ok(0),
        Some(d) => prev_digit = d.unwrap(),
    }

    // remaining chars
    for ch in chars {
        match ch.to_digit(10) {
            Some(d) => {
                if prev_digit == d {
                    sum = sum + prev_digit;
                }
                prev_digit = d;
            },
            _ => {},
        }
    }

    // final digit
    if prev_digit == first_digit.unwrap().unwrap() {
        sum = sum + prev_digit;
    }

    Ok(sum)
}

fn part2() -> Result<u32, io::Error> {
    let stdin = io::stdin();

    let mut handle = stdin.lock();

    let mut buffer = String::new();
    handle.read_to_string(&mut buffer)?;

    let mut sum: u32 = 0;

    let mut digits: Vec<u32> = Vec::new();

    // populpate digits
    let incoming = buffer.chars().map(|d| d.to_digit(10)).filter_map(|d| d);
    for digit in incoming {
        digits.push(digit);
    }

    // create sum
    for (i, &digit) in digits.iter().enumerate() {
        let len = digits.len();
        let comp_i = (i + len / 2) % len;
        let comparison_digit: u32 = digits[comp_i];
        if digit == comparison_digit {
            sum = sum + digit;
        }
    }

    Ok(sum)
}
