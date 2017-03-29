require 'rspec'

def anagram(original_arr)

  result_arr = []
  temp_arr = []

  until original_arr.empty? do
    temp_arr.push(original_arr.shift)
    template = temp_arr.first.split('').sort.join
    original_arr.each do |el|
      temp_arr.push(el) if el.split('').sort.join == template
    end
    original_arr.reject! { |l| l.split('').sort.join == template }
    result_arr.push(temp_arr)
    temp_arr = []
  end

  result_arr
end

describe 'Combine anagrams method' do
  it 'returns a nested array of anagram groups' do
    expect(anagram(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']))
      .to eq([["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]])
  end
end
