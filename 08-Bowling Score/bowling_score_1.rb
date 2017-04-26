require 'rspec'

class BowlingScore
  attr_reader :first_frame
  
  def initialize
    @first_frame = 0
  end

  def pins(rolls)
    @rolls = rolls
  end

  def score
    frame = 0
    score = 0

    while frame < 10
      if spare?
        score += bonus_for_spare
        @first_frame += 2
      elsif strike?
        score += bonus_for_strike
        @first_frame += 1
      else
        score += @rolls[first_frame] + @rolls[first_frame + 1]
        @first_frame += 2
      end
      frame += 1
    end
    score
  end

  private
  def spare?
    @rolls[first_frame] + @rolls[first_frame + 1] == 10
  end

  def strike?
    @rolls[first_frame] == 10
  end

  def bonus_for_spare
    10 + @rolls[first_frame + 2]
  end

  def bonus_for_strike
    10 + @rolls[first_frame + 1] + @rolls[first_frame + 2]
  end
end


describe BowlingScore do
  let(:game) { BowlingScore.new }

  it "scores a game with all 0's" do
    game.pins([0] * 20)
    expect(game.score).to eq(0)
  end

  it "scores a game with all 1's" do
    game.pins([1] * 20)
    expect(game.score).to eq(20)
  end

  it 'scores a game with spare' do
    game.pins([3, 7, 2] + [0] * 17)
    expect(game.score).to eq(14)
  end

  it 'scores a game with strike' do
    game.pins([10, 2, 4] + [0] * 17)
    expect(game.score).to eq(22)
  end

  it 'scores a perfect game' do
    game.pins([10] * 12)
    expect(game.score).to eq(300)
  end
end
