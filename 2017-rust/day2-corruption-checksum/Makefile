.PHONY: all
all: test

BIN := target/debug/day2-corruption-checksum

test: $(BIN)
	$(BIN) 1 < tests/1.txt
	$(BIN) 2 < tests/2.txt

$(BIN): main.rs
	cargo build
