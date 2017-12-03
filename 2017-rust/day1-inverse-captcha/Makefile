.PHONY: all
all: test

BIN := target/debug/day1-inverse-captcha

test: $(BIN)
	echo 1122 | $(BIN) 1
	echo 1111 | $(BIN) 1
	echo 1234 | $(BIN) 1
	echo 91212129 | $(BIN) 1

	echo 1212 | $(BIN) 2
	echo 1221 | $(BIN) 2
	echo 123425 | $(BIN) 2
	echo 123123 | $(BIN) 2
	echo 12131415 | $(BIN) 2

$(BIN): main.rs
	cargo build
