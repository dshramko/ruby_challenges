require 'stemmer'
require 'rspec'
require_relative 'file_reader'

class SentimentAnalyzer
  include FileReader

  attr_reader :mappings

  def initialize(text)
    @mappings = hash_from_json('en_words.json')
    @text = text
    @positive = 0.1
    @negative = -0.1
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
    valid_tokens = tokens.reject { |token|
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
    if weight.between?(@negative, @positive)
      'Neutral'
    elsif weight < @negative
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

