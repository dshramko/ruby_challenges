require 'rspec'

class WordCounter

  def count(file, amount)
    load_stop_words
    result_hash = {}
    File.open(file) do |f|
      f.each_line do |line|
        line.downcase.split.each do |word|
          unless @stop_words.include?(word.tr(".,()?!:;'`", ""))
            result_hash.has_key?(word) ? result_hash[word] +=1 : result_hash[word] = 1
          end
        end
      end
    end
    result_hash.sort_by { |k, v| [-v, k] }.first(amount).to_h
  end

  def load_stop_words
    @stop_words = []
    File.open('stop-words-english.txt') do |f|
      f.each_line do |line|
        @stop_words << line.chomp
      end
    end
  end
end

describe 'Word counter' do
  it 'counts most used words excluding stop words and outputs hash with them' do
    word_counter = WordCounter.new
    expect(word_counter.count("prophet.txt", 5)).to eq(
      {
        "eyes"    => 3,
        "desert"  => 2,
        "filled"  => 2,
        "god's"   => 2,
        "touched" => 2
      }
    )
  end
end
