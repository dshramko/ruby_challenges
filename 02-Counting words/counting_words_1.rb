require 'rspec'

class Counter
  def word_counter(file, amount)
    h = {}
    file_to_process = File.open(file)
    file_to_process.each do |line|
      line.split.each do |word|
        word = word.downcase.gsub(/[\.\,\)\(\?\!\:\;\s\'\`\-]/, "")
        h.has_key?(word) ? h[word] += 1 : h[word] = 1
      end
    end
    h.sort_by { |k, v| -v }[0..amount-1].to_h
  end
end

describe 'Word counter' do
  it 'counts most used words and outputs hash with them' do
    counter = Counter.new
    expect(counter.word_counter("prophet.txt", 5)).to eq(
      {
        "and" => 17,
        "my" => 10,
        "with" => 8,
        "of" => 7,
        "in" => 7
      }
    )
  end
end
