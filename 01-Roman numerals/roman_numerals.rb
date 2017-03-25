require 'rspec'

describe 'Roman converter' do
  it 'converts integer in range 1..4999 to roman numeral' do
    expect(convert_to_roman(1111)).to eq("MCXI")
    expect(convert_to_roman(3573)).to eq("MMMDLXXIII")
    expect(convert_to_roman(949)).to eq("CMXLIX")
    expect{ convert_to_roman(5000) }.to raise_error(ArgumentError)
  end
end
