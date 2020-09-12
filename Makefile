OUT_DIR=bin

all: build

build:
		mkdir -p $(OUT_DIR)
		crystal build --release src/decod.cr -o $(OUT_DIR)/decod
run: 
		$(OUT_DIR)/decod -h

clean:
		rm -rf $(OUT_DIR) .crystal .deps libs
