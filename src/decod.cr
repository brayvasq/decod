require "./decod/version"
require "option_parser"

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
end
