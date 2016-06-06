class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
module WithScores
  def best_score
    @scores.max
  end
  def sum_score
    sum = 0
    @scores.each{
        |i|
      sum += i
    }
    return sum
  end
  def avarage_score
    @scores.inject{ |sum, el| sum + el }.to_f / @scores.size
  end
end
class Player < Person
  include WithScores
  include Comparable
  attr_reader :scores

  def initialize(name, scores = [])
    super(name)
    if !scores.is_a? Numeric
      if !scores.is_a? Array
        @scores = []
      else
        @scores = scores
      end
    else
      @scores = scores
    end
  end
  def add_score(score)
    if score.is_a? Numeric
      @scores.push(score)
    elsif score.is_a? Array
      @scores = @scores + score
    end
  end
  def all_scores()
    sum = 0
    @scores.each{
      |i|
      sum += i
    }
    return sum
  end
  def to_s
    @name + " " + all_scores.to_s
  end
  def <=>(other)
    all_scores <=> other.all_scores
  end
end
scores = [2,3,4]
play = Player.new("jasio", scores)
play.add_score(5)
puts play
scores1= [1,1]
play2 = Player.new("foo", scores1)
scores2 = [9,9]
play2.add_score(scores2)
puts play2
play3 = Player.new("a", "B")
puts play3

puts play.sum_score, play.avarage_score, play.best_score

puts play < play2
puts play > play3
puts play > play2