Coordinate = Struct.new(:x, :y)

class Driver
  attr_accessor :coordinate,:name,:rating
  attr_writer :num
  def initialize(coordinate_x, coordinate_y,name,rating,num)
    @coordinate = Coordinate.new(coordinate_x,coordinate_y)
    @name = name
    @rating = rating
    @num = num
  end

  def new_rating(rate)
    @rating = (@rating * @num + rate ) / (@num + 1)
    @num = @num + 1
  end


end

a = Driver.new(2,3,"Hans",4,1)
puts a.name
