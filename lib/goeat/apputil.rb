require 'thor'
require_relative 'basicnconst'

module Goeat
  class History_List < Array # Container for every user's purchase history
  end

  class History
    # Class that save user's purchase history
    attr_accessor :store_name, total_cost
    def initialize(store_name, total_cost, item_bought)
      @store_name = store_name
      @total_cost = total_cost
      @item_bought = item_bought
      # item bought is 2d array that contain
      # [[item, number that user purchased], ...]
    end
  end

end
