require_relative 'position'
require 'pry-byebug'

class Board
  def initialize
    @origin = Position.new(0, 0)
    @prev_position = @origin
    create_bottom_row
    1.upto(7) { |row| create_row(row) }
  end

  # Generate bottom row that is doubly linked horizontally
  def create_bottom_row
    7.times do |col|
      position = Position.new(col + 1, 0)
      position.left = @prev_position
      @prev_position.right = position
      @prev_position = position
    end
  end

  def create_row(row)
    position_below = define_position_below(row)
    8.times do |col|
      position = Position.new(col, row)
      position_below = set_up_and_down_pointers(position, position_below)
      unless col.zero?
        position.left = @prev_position
        @prev_position.right = position
      end
      @prev_position = position
    end
  end

  def set_up_and_down_pointers(position, position_below)
    # binding.pry
    position.down = position_below
    position_below.up = position
    # Return position below right to reassign position below
    position_below.right
  end

  def define_position_below(row)
    position_below = @origin
    (row - 1).times do
      position_below = position_below.up
    end
    position_below
  end

  def add_knight_moves_to_board
    0.up_to(7) do |col|
      0.up_to(7) do |row|
        position = search_for_position(col, row)
        position.add_knight_moves
      end
    end
  end


  def search_for_position(col, row)
    current_position = @origin
    current_position = current_position.right until current_position.col == col
    current_position = current_position.up until current_position.row == row
    current_position
  end

  def print_board_subset
    puts "#{@origin.up} #{@origin.up.right}"
    puts "#{@origin} #{@origin.right}"
  end
end
