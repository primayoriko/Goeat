require 'thor'
require_relative 'basicnconst'
require_relative 'map'

module Goeat
  class Cli < Thor
    desc "start", 'lets start our fun by using this command to start the app'
    def start
      generate_map_menu
      generate_map
      initialize_container
      driver_n_store_add
      main_menu

    end

    no_commands do
      def generate_map_menu
        say 'which one do you prefer?'
        say '1. Random 20x20 map with 5 driver and 3 store'
        say '2. Choose your own map size and your coordinate'
        @action = ask '> '
      end

      def generate_map
        # Generating map with mode that user choose
        say "\n"
        case @action
        when '1' then @map = Map.new()
        when '2' then
          say 'What is the size of the map that you want (For optimum result size must bigger than four)'
          @size = ask '> '
          say 'What is your coordinate on x-axis (0<=x<size)'
          @x = ask '> '
          say 'What is your coordinate on x-axis (0<=y<size)'
          @y = ask '> '
          say "\n"
          @map = Map.new(@size.to_i,@x.to_i,@y.to_i)
        else quit_app
        end
      end

      def initialize_container
        @driverlist = Driver_List.new
        @storelist = Store_List.new
        @historylist = History_List.new
      end

      def driver_n_store_add
        #adding driver and store data to container and display their locations on map
        for i in (1..(@map.driver_num))
          coor = @map.random_loc('w', true)
          @map.map[coor.x][coor.y] = 'd'
          @driverlist << Driver.new(coor.x,coor.y,$DRIVER_NAME_SAMPLE.sample)
         end
        for i in (0...(@map.store_num))
          coor = @map.random_loc('g', true)
          @map.map[coor.x][coor.y] = 's'
          @storelist << Store.new(coor.x, coor.y)
          @storelist[i].add_name_n_menu($STORE_NAME_SAMPLE.sample, $STORE_TYPENMENU_SAMPLE)
        end
      end

      def main_menu
        say 'What do you want to do?'
        say '1. Show me the map'
        say '2. Order something to fill my tummy'
        say '3. What have i eaten? Show me the record'
        @action = ask '> '

        say "\n"
        case @action
        when '1' then show_map
        when '2' then order_menu
        when '3' then show_history

        end
      end

      def show_map
        say "\n"
        say "Here is the map that specially brought to you :"
        @map.show_map
        say "\n"
      end

      def order_menu
        driver_id = rand(0...@map.driver_num)
        puts "This is your driver : #{@driverlist[driver_id].name}\n"
        say "This is the store that you can order from there: \n"
        for i in 0...@storelist.size
          puts "#{i+1}. #{@storelist[i].name}"
        end
        say "\nSo, where do you want to buy?\n"
        @action = ask '> '
        @action = (@action.to_i)-1
        puts "So you decide to buy in #{@storelist[@action].name}, what do you want?\nThis is the menu:\n"

        for i in 0...@storelist[@action].menu.size
          #show the menu
          "#{i+1}. #{@storelist[@action].menu[i][0]} => #{@storelist[@action].menu[i][1].to_s}\n"
        end

        @price = 0
        @price += @map.manhattan_dist(@map.coordinate_user, @storelist[@action].coordinate)
        # Adding price that equal to the distance

        puts ("so what will you order ?")
        puts("write inorder number item, then enter then select how many do you want to buy")

        puts("what is the index do you want to buy? (to end your order, just input -999")
        idx = ask '> '
        while idx.to_i !=- 999
          puts("how many?")
          num = ask '> '
          @price += @storelist[@action].menu[(idx.to_i)-1][1] * num.to_i
        end
        # adding data to historylist
        # @historylist << History

        puts "So, this is the money you should pay #{@price}"
        puts ("Thank you, dont forget to give our driver rating too")
        rate = ask '> '
      end

      def show_history
        say 'This is what you have bought :'
        @historylist.each do |history|
          puts history.store_name
          history.item_bought.each do |sub|
            puts sub[0] + ' -> ' + sub[1].to_s + ' portion(s)'
          end
          puts "Total Cost : " + history.total_cost.to_s
          say "\n"
        end
      end

      def quit_app

      end
    end
  end
end