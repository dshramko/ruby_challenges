require 'rspec'

class Array
  def bubble_sort
    array_length = self.length

    loop do
      swapped = false
      (array_length-1).times do |i|
        if self[i] > self[i+1]
          self[i], self[i+1] = self[i+1], self[i]
          swapped = true
        end
      end
      break unless swapped
    end

    self
  end
end

describe 'Bubble sort algorithm' do
  it 'returns sorted array' do
    array = [5, 1, 4, 2, 8]
    expect(array.bubble_sort).to eq(array.sort)
  end
end
