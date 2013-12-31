class Game

  def initialize
    @rolls = Array.new(21)
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    score = 0
    first_in_frame = 0
    (0...10).each do
      if (is_strike(first_in_frame))
        score += 10 + next_two_balls_for_strike(first_in_frame)
        first_in_frame += 1
      elsif(is_spare(first_in_frame))
        score += 10 + next_ball_for_spare(first_in_frame)
        first_in_frame += 2
      else
        score += two_balls_in_frame(first_in_frame)
        first_in_frame += 2
      end
    end
    score
  end

  def is_spare(first_in_frame)
    @rolls[first_in_frame] + @rolls[first_in_frame + 1] == 10
  end

  def is_strike(first_in_frame)
    @rolls[first_in_frame]==10
  end

  def next_two_balls_for_strike(first_in_frame)
    @rolls[first_in_frame + 1] + @rolls[first_in_frame + 2]
  end

  def next_ball_for_spare(first_in_frame)
    @rolls[first_in_frame + 2]
  end

  def two_balls_in_frame(first_in_frame)
    @rolls[first_in_frame] + @rolls[first_in_frame + 1]
  end

end

