require 'rspec'

def convert_to_roman(arabic_number)
  if arabic_number.between?(1, 4999)
    num_arr = arabic_number.to_s.chars
    converted_string = ""
    i = 0
    loop do
      i += 1
      single_number = num_arr.pop.to_i
      converted_string.insert(0, set_position(single_number, i))
      break if num_arr.empty?
    end
    converted_string
  else
    raise ArgumentError, "Wrong argument"
  end
end

def set_position(number, position)
  case position
  when 1
    set_letter('I', 'V', "X", number)
  when 2
    set_letter('X', 'L', "C", number)
  when 3
    set_letter('C', 'D', "M", number)
  when 4
    if number.between?(1, 4)
      "M" * number
    end
  else
    raise ArgumentError, "Wrong argument"
  end
end

def set_letter (one, five, ten, number)
    if number.between?(1, 3)
      one * number
    elsif number == 4
      one + five
    elsif number == 5
      five
    elsif number.between?(6, 8)
      five + (one * (number-5))
    elsif number == 9
      one + ten
    end
end

describe 'Roman converter' do
  it 'converts integer in range 1..4999 to roman numeral' do
    expect(convert_to_roman(1111)).to eq("MCXI")
    expect(convert_to_roman(3573)).to eq("MMMDLXXIII")
    expect(convert_to_roman(949)).to eq("CMXLIX")
    expect{ convert_to_roman(5000) }.to raise_error(ArgumentError)
  end
end
