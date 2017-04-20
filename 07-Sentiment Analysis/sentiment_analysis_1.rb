require 'stemmer'
require 'rspec'

class SentimentAnalyzer

  def initialize(text)
    @mappings = {}
    @text = text
    load_mappings
  end

  # Make hash of words and weight from file
  def load_mappings
    word_file = File.new("words.txt", 'r')

    while (line = word_file.gets)
      tokens = line.chomp.split("\t")
      @mappings[tokens[1]] = tokens[0].to_f
    end
    word_file.close

    @mappings
  end

  # Remove non-alphabetic and non-numeric characters
  def normalize(str)
    str.gsub(/[^[:alnum:]]/, ' ').downcase
  end

  # Stemmer
  def tokenize(str)
    str.split.map(&:stem)
  end

  def weigh(tokens)
    valid_tokens = tokens.delete_if { |token|
      @mappings[token] == nil
    }
    return 0 if valid_tokens.length == 0

    sum = 0
    valid_tokens.each { |token|
      sum += @mappings[token]
    }

    sum / valid_tokens.length
  end

  def analyze
    str = tokenize(normalize(@text))
    weight = weigh(str)
    if weight.between?(-0.1, 0.1)
      'Neutral'
    elsif weight < -0.1
      'Negative'
    else
      'Positive'
    end
  end
end

describe 'Sentiment Ananlyzer' do
  text1 = "Literally your facebook message app is useless, you only want it to increase profit. Please fix yourself. Its sad."
  text2 = "I’m thinking of you, sleep with the angels sweet one"
  text3 = "Arrays are ordered, integer-indexed collections of any object."

  it 'returns negative weight of given text' do
    sa = SentimentAnalyzer.new(text1)
    expect(sa.analyze).to eq('Negative')
  end
  it 'returns positive weight of given text' do
    sa = SentimentAnalyzer.new(text2)
    expect(sa.analyze).to eq('Positive')
  end
  it 'returns neutral weight of given text' do
    sa = SentimentAnalyzer.new(text3)
    expect(sa.analyze).to eq('Neutral')
  end
end
