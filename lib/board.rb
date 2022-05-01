require_relative 'position'
require 'pry-byebug'

class Board
  def initialize
    @origin = Position.new(0, 0)
    @all_positions = [@origin]
    0.upto(7) do |col|
      0.upto(7) do |row|
        @all_positions << Position.new(col, row)
      end
    end
    assign_knight_moves
  end

  def assign_knight_moves
    @all_positions.each do |position|
      assign_moves_up(position)
      assign_moves_right(position)
      assign_moves_down(position)
      assign_moves_left(position)
    end
  end


  def assign_moves_up(position)
    position.up_left = @all_positions.find do |move|
      (position.col - 1) == move.col && (position.row + 2) == move.row
    end
    position.up_right = @all_positions.find do |move|
      (position.col + 1) == move.col && (position.row + 2) == move.row
    end
  end

  def assign_moves_right(position)
    position.right_up = @all_positions.find do |move|
      (position.col + 2) == move.col && (position.row + 1) == move.row
    end
    position.right_down = @all_positions.find do |move|
      (position.col + 2) == move.col && (position.row - 1) == move.row
    end
  end

  def assign_moves_down(position)
    position.down_left = @all_positions.find do |move|
      (position.col - 1) == move.col && (position.row - 2) == move.row
    end
    position.down_right = @all_positions.find do |move|
      (position.col + 1) == move.col && (position.row - 2) == move.row
    end
  end

  def assign_moves_left(position)
    position.left_up = @all_positions.find do |move|
      (position.col - 2) == move.col && (position.row + 1) == move.row
    end
    position.left_down = @all_positions.find do |move|
      (position.col - 2) == move.col && (position.row - 1) == move.row
    end
  end
end
