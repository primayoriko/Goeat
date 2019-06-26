require 'thor'
require_relative 'basicnconst', 'driver', 'store', 'user'

class Map
  attr_accessor :map, :people
  @map = [[]]
  private
    def dfs(coordinate_x, coordinate_y)
      dds
    end
  end
  def initialize(size=20,coordinate_user_x=rand(0...20),coordinate_user_y=rand(0...20)) # initializing maps size and coordinate at first
    @map = Array.new(size){Array.new(size)}
    @map[coordinate_user_x][coordinate_user_y]='u'
    @coordinate_user = Coordinate.new(coordinate_user_x,coordinate_user_y)

  end

end
