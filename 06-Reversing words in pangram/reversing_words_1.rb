require 'rspec'

def sentence_reverser(sentence)
  sentence.split.reverse.join(" ")
end

describe 'Sentence reverser' do
  it 'reverses words in a sentence' do
    sentence = 'jack and queen evil the for brew toxic make wizards Grumpy'
    expect(sentence_reverser(sentence)).to eq('Grumpy wizards make toxic brew for the evil queen and jack')
  end
end

