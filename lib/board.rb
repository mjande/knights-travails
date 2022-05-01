# frozen_string_literal: true

require 'pry-byebug'

# Board Class sets up 8x8 board filled with nil elements. This class is exists
# for the purpose of visualization for testing, and as a possible trial for
# implementing a working, filled board for future Chess project.
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
