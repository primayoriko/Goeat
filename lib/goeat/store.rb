require 'thor'
require_relative 'basicnconst'

class Store_List < Array
end

class Store
  attr_accessor :coordinate,:name, :menu
  def initialize(coordinate_x, coordinate_y)
    @coordinate = Coordinate.new(coordinate_x,coordinate_y)
  end
  def add_name_n_menu(store_name_sample, store_typenmenu_sample)
  # Adding store name and menu from constant tables
  # store_name_sample must be a string
  # store_typenmenu_sample must be a hash with structure :
  #   hash = {storetype (this is must be string too) => [[menuname, price], ....], ....}

    @name = store_name_sample
    @store_type = store_typenmenu_sample.keys.sample
    @name = @name + @store_type + rand(1..50).to_s
    @menu= []

    store_typenmenu_sample[@store_type].each do |menu|
      @menu << menu
    end
  end
end
