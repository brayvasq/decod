# A util module to parse text to binary
#  and binary to text
module Decod::Binary
  # This methods parse a simple text to his binary code equivalent.
  # The process to calculate the binary code for a char is the following:
  #   - Obtain the ASCII code of the char. Example: char = "h", code = 104
  #   - To obtain the binary code, we must divide the number by 2, and check the remainder. So:
  #     - if we have an remainder we put 1 to the string, otherwise we put 0.
  #     - NOTE: We put the values at the beginning of the string.
  #
  #     | value | divider      | module  | reminder | string    |
  #     | ----- | ------------ | ------- | -------- | --------- |
  #     | 104   | 104 / 2 = 56 | 104 % 2 | 0        | "0"       |
  #     | 52    | 52 / 2 = 28  | 52 % 2  | 0        | "00"      |
  #     | 26    | 26 / 2 = 13  | 26 % 2  | 0        | "000"     |
  #     | 13    | 13 / 2 = 6   | 13 % 2  | 1        | "1000"    |
  #     | 6     | 6 / 2 = 3    | 6 % 2   | 0        | "01000"   |
  #     | 3     | 3 / 2 = 1    | 3 % 2   | 1        | "101000"  |
  #     | 1     | 1 / 2 = 0    | 1 % 2   | 1        | "1101000" |
  #
  #     - As we have to represent the binary code as a group of eigth bits, we must fill with "0"
  #       at the left of the string, so the result is 01101000.
  #
  # @params text [String] the string to parse
  #
  # @return [String] the binary code equivalent for the text
  def self.text_to_binary(text)
    result = ""

    text.chars.each do |i|
      val : Int32 = i.ord.to_i
      bin = ""

      while val > 0
        bin = (val % 2 != 0 ? "1" : "0") + bin
        val = (val / 2).to_i
      end

      bin = (bin.size == 8) ? bin : (("0" * (8 - bin.size)) + bin)

      result += bin + " "
    end

    result.rstrip
  end

  # This methods parse a simple text to his binary code equivalent.
  #   - Each block has a size of 8 bits.
  #   - We have to use the pow of two.
  #
  #     | 2^0  | 2^1  | 2^2  | 2^3  | 2^4  | 2^5  | 2^6  | 2^7  |
  #     | 1    | 2    | 4    | 8    | 16   | 32   | 64   | 128  |
  #
  #   - So we for binary = "01101000", char = "h"
  #
  # The process to calculate the binary code for a char is the following:
  #   - Iterate each character from right to left.
  #   - Start the counter from 0 to string size - 1, 7
  #   - Multiply each value by (2 pow counter)
  #   
  #      | string       | char = string[n] | pow = 2^n | value += pow * char |
  #      | ------------ | ---------------- | --------- | ------------------- |
  #      |  "01101000"  | 0                | 2^0 = 1   | 0                   |
  #      |  "01101000"  | 0                | 2^1 = 2   | 0                   |
  #      |  "01101000"  | 0                | 2^2 = 4   | 0                   |
  #      |  "01101000"  | 1                | 2^3 = 8   | 8                   |
  #      |  "01101000"  | 0                | 2^4 = 0   | 8                   |
  #      |  "01101000"  | 1                | 2^5 = 32  | 40                  |
  #      |  "01101000"  | 1                | 2^6 = 64  | 104                 |
  #      |  "01101000"  | 0                | 2^7 = 128 | 104                 |
  # 
  # @params binary [String] the string to parse
  #
  # @return [String] the text equivalent for the binary code
  def self.binary_to_text(binary)
    result = ""

    binary.split(" ").each do |i|
      unless i.empty? && i.blank?
        pot = value = 0

        i.reverse.chars.each do |j|
          value += (j.to_i * (2 ** pot))
          pot += 1
        end

        result += value.chr
      end
    end

    result.rstrip
  end
end
