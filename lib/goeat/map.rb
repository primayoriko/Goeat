require 'thor'
require_relative 'basicnconst', 'driver', 'store', 'user'

class Map
  # This class define map structure and method that
  # can we operate with the map.
  # which the map is symbolized with this letter:
  # g : ground /unoccupied land
  # w ; way/road
  # d : driver
  # u : user

  attr_accessor :map, :coordinate_user, :size
  @map = [[]]
  @driver_num=0
  @store_num=0
  private
    def dfs(coordinate_x, coordinate_y)
      arr = [-1,0,1]
      arr.each do |x|
        arr.each do |y|

        end
       end
    end
  end

  def show_map()

  end

  def initialize(size=20,coordinate_user_x=rand(0...20),coordinate_user_y=rand(0...20)) # initializing maps size and coordinate at first
    @map = Array.new(size){Array.new(size)}
    if size == 20
      @driver_num = 5
      @store_num = 3
    else
      @driver_num = rand(0..[size/4,12].max)
      @store_num = rand(0..[size/6,6].max)

    @coordinate_user = Coordinate.new(coordinate_user_x,coordinate_user_y)
    @map[@coordinate_user.x][@coordinate_user.y]='u'
    dfs(@coordinate_user.x,@coordinate_user.y)

    end

    def random_loc(ground_type='g', arg=true)
    # generate a random location that meet arg and ground_type requirement
    # note : the class that method's return is Coordinate
      x=0
      y=0
      loop do
        x = rand(0...@size)
        y = rand(0...@size)
        break if ((arg)?(@map[x][y] == ground_type):(@map[x][y] != ground_type))
      end
      rand_loc = Coordinate.new(x,y)
    end

end
