require 'thor'
require_relative 'basicnconst'

module Goeat
  attr_accessor :coordinate
  class AppUtil # class for application usage
    def initialize(coordinate_x, coordinate_y) # make our coordinate for first time
      @coordinate = Coordinate.new(coordinate_x,coordinate_y)
    end

    def path(coordinate_user_x,coordinate_user_y,coordinate_driver_x,coordinate_driver_y) #search and printing path with dijkstra algorithm

    end

    def order()

    end
  end
end
