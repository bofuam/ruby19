#file: path.rb
class Path
  attr_reader :points
  attr_reader :max_length
  MAX_LENGTH = 10
  def initialize(max = MAX_LENGTH, points)
    @max_length = max
    @points = points
  end
  def add_point(point)
   if @points.size > @max_length
      puts "full array"
    else
      @points.push(point)
   end

  end
  def pairs()
    newpoints = []
    @points.each_with_index {
        |point, ind|
      if ind+1 < @points.size
        pair = [point, @points[ind+1]]
      else
        pair = [point, @points.first]
      end
      newpoints.push(pair)
    }
    return newpoints
  end
  def length()
    leng = 0
    pairs().each{
        |elem|
      # a = elem[1].x - elem[0].x
      # b = elem[1].y - elem[0].z
      # c = elem[1].z - elem[0].z
      # dist = a + b + c
      leng += elem[1].euclidan(elem[0])
    }
    return leng
  end
  private :pairs
end
class Point3D
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z
  def initialize(a=0.0, b=0.0, c=0.0)
    @x = a
    @y = b
    @z = c
  end
  def set(a, b, c)
    @x = a
    @y = b
    @c = c
  end
  def move(x, y, z)
    Point3D.new(@x + x, @y + y, @z + z)
  end
  def move!(x, y, z)
    @x = @x +x
    @y = @y + y
    @z = @z + z
  end
  def zero?
    if @x + @y + @z == 0.0 then return true end
  end
  def euclidan(point)
    a = point.x - @x
    b = point.y - @y
    c = point.z - @z
    return Math.sqrt(a*a+b*b+c*c)
  end
  alias_method :dist, :euclidan
end

moveOne = Point3D.new(1,1,1)
be = moveOne.move(1,2,3)
moveTwo = Point3D.new(2,2,2)
table = [moveOne, moveTwo]
 path = Path.new(3, table)
path.add_point(be)
ce = moveOne.move(4,4,4)
 path.add_point(ce)
 puts path.length()