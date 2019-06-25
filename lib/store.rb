def Store
  attr_accessor :coordinate,:name
  def initialize(coordinate_x, coordinate_y, name, menu)
    @coordinate = Coordinate.new(coordinate_x,coordinate_y)
    @name = name


  end

end
