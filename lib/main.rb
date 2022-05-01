# frozen_string_literal: true

require_relative 'knight'
require_relative 'board'

board = Board.new
knight = Knight.new(board)
knight.knight_moves([3, 7], [6, 1])
