require 'thor'

module Goeat
  class Cli < Thor
    $a=0
    desc "hellow", 'just that'
    def Hello
      puts "hello there"
    end
    desc 'set a', 'yo'
    def seta a
      $a = a
      puts $a
    end
    desc 'wha a', 'hmm'
    def wha
      puts $a
    end
  end
end