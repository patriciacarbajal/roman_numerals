class RomanToArabicConverter

  ROMAN_TO_ARABIC_MAP = {
    "M"=>1000,
    "CM"=>900,
    "D"=>500,
    "CD"=>400,
    "C"=>100,
    "XC"=>90,
    "L"=>50,
    "XL"=>40,
    "X"=>10,
    "IX"=>9,
    "V"=>5,
    "IV"=>4,
    "I"=>1
  }

  def convert(roman)
    raise "input must be a string" if !roman.is_a?(String)
    keys = ROMAN_TO_ARABIC_MAP.keys
    result = 0
    keys.each do |i|
      while roman.start_with?(i)
        result += ROMAN_TO_ARABIC_MAP[i]
        roman = roman.slice(i.length, (roman.length - i.length))
      end
    end
    raise "invalid roman input" if !roman.empty?
    result
  end

end
