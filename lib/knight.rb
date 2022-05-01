# frozen_string_literal: true

require_relative 'board'
require_relative 'position'
require 'pry-byebug'

# Includes knight_moves to calculate shortest path from start to end. The class
# accomplishes this by interacting with Position class to determine possible
# moves, and looping through a breadth-level iteration to find the shortest path.
class Knight
  def initialize(board)
    # Board assignment (and Board class) not actually necessary for the final
    # working version, but kept for future reference for Chess project.
    @board = board
    @queue = []
  end

  def knight_moves(start_position, end_position)
    @start_position = start_position
    @end_position = end_position
    @queue.push(Position.new(start_position[0], start_position[1], nil))
    @children = 1
    search_for_position
  end

  def search_for_position
    loop do
      # For the total number of children in level (added in method below)
      @children.times do
        position = @queue.shift
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

      move[0] == @end_position[0] && move[1] == @end_position[1]
    end
  end

  def print_path(pen_position)
    position = pen_position
    return_array = ["[#{@end_position[0]}, #{@end_position[1]}]"]
    until position.parent.nil?
      return_array << position
      position = position.parent
    end
    return_array << @start_position.to_s
    puts "You made it in #{return_array.length - 1} moves! Here is your path:"
    puts return_array.reverse
  end
end
