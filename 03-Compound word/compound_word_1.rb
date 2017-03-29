#require 'benchmark'
require 'rspec'

class Words
  def initialize
    @compound_word = ''
    @eng_words_arr = []
    @min_sub = 0
    @result_array = []
  end

  def load_eng_words(filename)
    file = File.open(filename, 'r')
    file.each_line do |line|
      line.chomp!
      @eng_words_arr.push line unless line.empty?
    end
    file.close
  end

  def sub_words_finder(word, min_sub)
    @compound_word = word.downcase
    @min_sub = min_sub
    load_eng_words("wordlist.txt")
    @eng_words_arr.each do |w|
      check_for_word(w)
    end
    @result_array.unshift(@result_array.length)
  end

  def check_for_word(word)
    offset = @compound_word.length - @min_sub
    pos = 0
    len_offset = @min_sub
    while offset >= 1 do
      for i in pos..offset do
        @result_array << @compound_word[i, len_offset] if (@compound_word[i, len_offset] == word)
      end
      offset -= 1
      len_offset += 1
    end
  end
end

describe 'Sub-words finder' do
  before(:each) { @w = Words.new }
  it "returns sub-words from word 'Something' with sub-word lenght = 3" do
    expect(@w.sub_words_finder("Something", 3)).to eq(
      [6, "hin", "ing", "met", "some", "thin", "thing"]
    )
  end
  it "returns sub-words from word 'Operation' with sub-word lenght = 5" do
    expect(@w.sub_words_finder("Operation", 5)).to eq(
      [3, "opera", "ratio", "ration"]
    )
  end
end
