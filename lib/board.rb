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
end
