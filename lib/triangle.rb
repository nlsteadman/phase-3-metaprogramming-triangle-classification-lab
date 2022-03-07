class Triangle
  attr_accessor :x, :y, :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def kind
    triangle_valid
    if x == y && y == z
      :equilateral
    elsif x == y || x == z || y == z
      :isosceles
    else
      :scalene
    end
  end

  def greater_than_zero
    [x, y, z].all?(&:positive?)
  end
  
  def triangel_inequality
    x + y > z && y + z > x && z + x > y
  end

  def triangle_valid
    raise TriangleError unless greater_than_zero && triangel_inequality
  end

  class TriangleError < StandardError
  end  
end
