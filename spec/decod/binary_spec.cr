require "../spec_helper"

describe Decod::Binary do
  describe "#text_to_binary" do
    it "parse text to binary" do
      text = "Hello"
      result = "01001000 01100101 01101100 01101100 01101111"
      Decod::Binary.text_to_binary(text).should eq result
    end
  end

  describe "#binary_to_text" do
    it "parse binary to text (without end spaces)" do
      binary = "01001000 01100101 01101100 01101100 01101111"
      result = "Hello"
      result = Decod::Binary.binary_to_text(binary).should eq result
    end

    it "parse binary to text (with end spaces)" do
      binary = "01001000 01100101 01101100 01101100 01101111   "
      result = "Hello"
      result = Decod::Binary.binary_to_text(binary).should eq result
    end

    it "parse binary to text (with start spaces)" do
      binary = "   01001000 01100101 01101100 01101100 01101111"
      result = "Hello"
      result = Decod::Binary.binary_to_text(binary).should eq result
    end
  end
end
