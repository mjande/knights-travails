require_relative 'board'
require 'pry-byebug'

# 1. Create knight and place at coordinates given
# 2. Start generating tree with possible turn 1 moves 
# 3. Breadth-search tree for possible moves matching desired destination
# 4. If no match, generate next level
# 5. Continue 4 + 5 until a match is found
# 6. Return array of each position from start to end along branches

class Knight 
  def initialize
    @board = Board.new
    puts board.origin.print_moves
  end
  
  def knight_moves(start_coord, end_coord)
    # starting_position = @board.search_for_position(start_coord[0],start_coord[1])
    # binding.pry
    # @head = Node.new(starting_position)
    # node = @head
    # return path
  end

end

