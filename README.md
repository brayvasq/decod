# decod
This is a simple library to encode, decode, cipher and decipher texts using differents algorithms.

**Features**
- Parse Binary to Text.
- Parse Text to Binary

## Installation
```bash
# Clone repo
git clone https://github.com/brayvasq/decod

# Complite project
make build

# Run specs 
crystal spec -p

# Show docs
crystal docs
```

## Usage
**Getting version**
```bash
./bin/decod -v
./bin/decod --version

0.1.0
```

**Getting Help**
```bash
./bin/decod -h
./bin/decod --help

Welcome to The Decod App!
    -v, --version                    Show version
    -h, --help                       Show help
    -b TEXT, --binary=TEXT           Text to binary
    -t TEXT, --text=TEXT             Binary to text
```

**Parse text to binary**
```bash
./bin/decod -b "Hello World"
./bin/decod --binary "Hello World"

01001000 01100101 01101100 01101100 01101111 00100000 01010111 01101111 01110010 01101100 01100100
```

**Parse binary to text**
```bash
./bin/decod -t "01001000 01100101 01101100 01101100 01101111 00100000 01010111 01101111 01110010 01101100 01100100"
./bin/decod --text "01001000 01100101 01101100 01101100 01101111 00100000 01010111 01101111 01110010 01101100 01100100"

Hello World
```

## Contributing

1. Fork it (<https://github.com/brayvasq/decod/fork>)
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Commit your changes (`git commit -am 'add: some feature'`)
4. Push to the branch (`git push origin feature/my-new-feature`)
5. Create a new Pull Request

## Contributors

- [@brayvasq](https://github.com/brayvasq) - creator and maintainer
