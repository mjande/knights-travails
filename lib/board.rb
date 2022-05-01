require_relative 'position'
require_relative 'knight'
require 'pry-byebug'

class Board
  attr_accessor :board_array
  
  def initialize
    @board_array = []
    8.times do
      array = Array.new(8, nil)
      @board_array.push(array)
    end
  end

  def print_board
    puts '---------------------------------'
    @board_array.reverse.each do |row|
      print '|'
      row.each do |col| 
        if col.nil? 
          print '   |'
        else
          print " #{col} |"
        end
      end
      print "\n"
      puts '---------------------------------'
    end
  end
end
