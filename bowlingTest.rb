require './game'
require "test/unit"

class BowlingTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def teardown

  end

  def roll_many(n, pins)
    (0...n).each{@game.roll(pins)}
  end

  def roll_spare
    @game.roll(5)
    @game.roll(5)
  end

  def roll_strike
    @game.roll(10)
  end

  def test_gutter_game
    roll_many(20,0)
    assert_equal(@game.score, 0)
  end

  def test_all_ones
    roll_many(20,1)
    assert_equal(@game.score, 20)
  end

  def test_one_spare
    roll_spare
    @game.roll(3)
    roll_many(17, 0)
    assert_equal(@game.score, 16)
  end

  def test_one_strike
    roll_strike
    @game.roll(3)
    @game.roll(4)
    roll_many(16, 0)
    assert_equal(@game.score, 24)
  end

  def test_perfect_game
    roll_many(12, 10)
    assert_equal(@game.score, 300)
  end

end
