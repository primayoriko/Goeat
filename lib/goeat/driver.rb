require 'thor'
require_relative 'basicnconst'

module Goeat
  class Driver_List < Array
  end

  class Driver
    attr_accessor :coordinate,:name,:rating
    attr_writer :num
    def initialize(coordinate_x, coordinate_y, name)
    # when construct the driver data
      @coordinate = Coordinate.new(coordinate_x,coordinate_y)
      @name = name
      @rating = 0
      @order = 0
    end

    def new_rating(rate)
    # rating that user gave to the driver after finishing a drive
      @rating = (@rating * @order * 1.0 + rate * 1.0 ) / (@order + 1)
      @order = @order + 1
    end

  end
end

