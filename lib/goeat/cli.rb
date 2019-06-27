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
        say"\n"
      end

      def order_menu

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