require "./decod/version"
require "./decod/binary"
require "option_parser"

# CLI interface
OptionParser.parse do |parser|
  parser.banner = "Welcome to The Decod App!"

  parser.on "-v", "--version", "Show version" do
    puts Decod::VERSION
    exit
  end

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end

  parser.on "-b TEXT", "--binary=TEXT", "Text to binary" do |text|
    puts Decod::Binary.text_to_binary(text)
    exit
  end

  parser.on "-t TEXT", "--text=TEXT", "Binary to text" do |binary|
    puts Decod::Binary.binary_to_text(binary)
    exit
  end
end
