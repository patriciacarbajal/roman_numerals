require_relative "./roman_numeral_converter.rb"

describe "Roman Numeral Converter" do
  context "roman numeral to arabic conversion" do
    before { @converter = RomanToArabicConverter.new }

    context "roman numeral is valid" do
      context "roman numeral is one character" do
        specify { expect(@converter.convert("I")).to eq(1) }
        specify { expect(@converter.convert("V")).to eq(5) }
        specify { expect(@converter.convert("X")).to eq(10) }
        specify { expect(@converter.convert("L")).to eq(50) }
        specify { expect(@converter.convert("C")).to eq(100) }
        specify { expect(@converter.convert("D")).to eq(500) }
        specify { expect(@converter.convert("M")).to eq(1000) }
      end
      context "addition between roman numerals" do
        specify { expect(@converter.convert("CXI")).to eq(111) }
        specify { expect(@converter.convert("CCC")).to eq(300) }
        specify { expect(@converter.convert("DIX")).to eq(509) }
      end
      context "roman numerals that are two character long" do
        specify { expect(@converter.convert("IV")).to eq(4) }
        specify { expect(@converter.convert("IX")).to eq(9) }
        specify { expect(@converter.convert("XL")).to eq(40) }
        specify { expect(@converter.convert("XC")).to eq(90) }
        specify { expect(@converter.convert("CD")).to eq(400) }
        specify { expect(@converter.convert("CM")).to eq(900) }
      end
    end

    context "roman numeral is invalid" do
      specify { expect{ @converter.convert(123) }.to raise_error("input must be a string") }
      specify { expect{ @converter.convert("XIQ") }.to raise_error("invalid roman input") }
      specify { expect{ @converter.convert("BOGUS") }.to raise_error("invalid roman input") }
    end
  end
end
