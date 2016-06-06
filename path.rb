#file: path.rb
class Path
  attr_reader :points
  attr_reader :max_length
  MAX_LENGTH = 10
  def initialize(max = MAX_LENGTH, points)
    @points = points[]
    @max_length = max
  end
  def add_point(point)
    if @points.size > @max_length
      puts "full array"
    else
      @points.push(point)
    end
  end
  def pairs()
    return @points.each_slice(2).to_a
  end
  def length()
    leng = 0
    arrone = pairs
    arrone.each{
      |elem|
      a = elem[1].x - elem[0].x
      b = elem[1].y - elem[0].z
      c = elem[1].z - elem[0].z
      dist = a + b + c
      findist = Math.sqrt(dist)
      leng = leng + findist
    }
    return leng
  end
  private :pairs
end