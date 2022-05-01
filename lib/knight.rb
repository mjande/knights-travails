require_relative 'board'
require_relative 'position'
require 'pry-byebug'

class Knight
  def initialize(board)
    @board = board
    @queue = []
  end

  def knight_moves(start_position, end_position)
    @board.board_array[start_position[1]][start_position[0]] = 'N'
    @start_position = start_position
    @end_col = end_position[0]
    @end_row = end_position[1]
    position = Position.new(start_position[0], start_position[1], nil)
    @queue.push(position)
    @children = 1
    loop do
      # For the total number of children in level
      @children.times do
        # Add next position from queue to variable
        position = @queue.shift
        # Check possible moves of that position
        if check_possible_moves(position)
          print_path(position)
          return
        else
          add_possible_moves_to_queue(position)
        end
        @children -= 1
      end
    end
  end

  def add_possible_moves_to_queue(position)
    position.possible_moves.each do |move|
      next if move.nil?

      @queue.push(Position.new(move[0], move[1], position))
      @children += 1
    end
  end

  def check_possible_moves(position)
    position.possible_moves.any? do |move|
      next if move.nil?

      move[0] == @end_col && move[1] == @end_row
    end
  end

  def print_path(pen_position)
    position = pen_position
    return_array = ["[#{@end_col}, #{@end_row}]"]
    until position.parent.nil?
      return_array << position
      position = position.parent
    end
    return_array << @start_position.to_s
    puts "You made it in #{return_array.length - 1} moves! Here is your path:"
    puts return_array.reverse
  end
end
