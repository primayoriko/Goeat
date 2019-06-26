require 'thor'
require_relative 'basicnconst', 'driver', 'store', 'user'

class Map
  # This class define map structure and method that
  # can we operate with the map.
  # which the map is symbolized with this letter:
  # g : ground /unoccupied land
  # w ; way/road (we define that road can't be a member of perimeter blocks)
  # d : driver (driver must be on the road)
  # u : user

  attr_accessor :map, :coordinate_user, :size
  @map = [[]]
  @driver_num=0
  @store_num=0
  private
    def is_valid_make_road(coordinate_x, coordinate_y)
      # Function that tell us if we can make a road here or no
      valid = true
      if(@map[coordinate_x + 1][coordinate_y_+ 1]='w')
        if (@map[coordinate_x + 0][coordinate_y_+ 1]='w' &&
            @map[coordinate_x + 1][coordinate_y_+ 0]='w')
          valid = false
        end
      end
      if (@map[coordinate_x + 1][coordinate_y_+ -1]='w')
        if (@map[coordinate_x + 0][coordinate_y_+ -1]='w' &&
            @map[coordinate_x + 1][coordinate_y_+ 0]='w')
          valid = false
        end
      end
      if (@map[coordinate_x + -1][coordinate_y_+ 1]='w')
        if (@map[coordinate_x + 0][coordinate_y_+ 1]='w' &&
            @map[coordinate_x + -1][coordinate_y_+ 0]='w')
          valid = false
        end
      end
      if (@map[coordinate_x + -1][coordinate_y_+ -1]='w')
        if (@map[coordinate_x + 0][coordinate_y_+ -1]='w' &&
            @map[coordinate_x + -1][coordinate_y_+ 0]='w')
          valid = false
        end
      end
      valid
    end

    def dfs(coordinate_x, coordinate_y)
      # depth first search algo implementation to generate map
      if (is_valid_make_road(coordinate_x, coordinate_y) &&
          coordinate_x > 0 && coordinate_x < size-1 &&
          coordinate_y > 0 && coordinate_y < size-1
        @map[coordinate_x][coordinate_y]='w'

        arr = [[1,0],[-1,0],[0,1],[0,-1]]
        arr.each do |sub|
          if(coordinate_x + sub[0] > 0 && coordinate_x + sub[0] < size-1 &&
              coordinate_y + sub[1] > 0 && coordinate_y + sub[1] < size-1)
            # only do dfs if this block are not a member of perimeter blocks
            dfs(coordinate_x + sub[0],coordinate_y + sub[1])
          end
      end
    end
  end

  def show_map()
   # printing map to the screen
    (0...size).to_a.each do |x|
      (0...size).to_a.each do |y|
        print(@map[x][y])
      end
      puts()
    end
  end

  def initialize(size=20,coordinate_user_x=rand(0...20),coordinate_user_y=rand(0...20)) # initializing maps size and coordinate at first
    @map = Array.new(size){Array.new(size)}

    # initilize number of driver and store on map
    if size == 20
      @driver_num = 5
      @store_num = 3
    else
      @driver_num = rand(0..[size/4,12].max)
      @store_num = rand(0..[size/6,6].max)
    end

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
