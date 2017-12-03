.PHONY: all
all: test

BIN := target/debug/day1-inverse-captcha

test: $(BIN)
	echo 1122 | $(BIN) 1
	echo 1111 | $(BIN) 1
	echo 1234 | $(BIN) 1
	echo 91212129 | $(BIN) 1

$(BIN): main.rs
	cargo build
