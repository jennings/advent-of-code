use std::io::{self, BufRead};

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
    let stdin_lock = stdin.lock();
    let checksum = stdin_lock.lines()
        .filter_map(Result::ok)
        .map(|line| {
            let vec_of_strings = line.split_whitespace();
            let vec: Vec<u32> = vec_of_strings.map(str_to_digit).collect();
            get_row_checksum(vec)
        })
        .sum();
    Ok(checksum)
}


fn get_row_checksum(row: Vec<u32>) -> u32 {
    let min = row.iter().min();
    let max = row.iter().max();
    match (min, max) {
        (Some(min), Some(max)) => max - min,
        _ => 0,
    }
}

fn str_to_digit(s: &str) -> u32 {
    u32::from_str_radix(s, 10).unwrap()
}


fn part2() -> Result<u32, io::Error> {
    panic!("not implemented");
}
