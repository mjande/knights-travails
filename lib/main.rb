require_relative 'knight'
require_relative 'board'

board = Board.new
knight = Knight.new(board)
knight.knight_moves([0, 0], [7, 7])
# board.print_board