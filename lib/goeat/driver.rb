require 'thor'
require_relative 'basicnconst'

module Goeat
  class Driver
    attr_accessor :coordinate,:name,:rating
    attr_writer :num
    def initialize(coordinate_x, coordinate_y,name)
    # when construct the driver data
      @coordinate = Coordinate.new(coordinate_x,coordinate_y)
      @name = name
      @rating = 0
      @order = 0
    end

    def new_rating()
    # rating that user gave to the driver after finishing a drive
      puts "Please give rating for this driver to improve our system."
      rate = gets('Rating : ')
      @rating = (@rating * @order + rate ) / (@order + 1)
      @order = @order + 1
      puts "Thanks for helping us."
    end


  end
end

