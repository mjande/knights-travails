class Position
  attr_reader :col, :row, :possible_moves, :parent
  attr_accessor :up_right, :right_up, :right_down, :down_right, :down_left, :left_down, :left_up, :up_left

  def initialize(col, row, parent)
    @parent = parent
    @col = col
    @row = row
    assign_possible_moves_right
    assign_possible_moves_left
    @possible_moves = [@up_right, @right_up, @right_down, @down_right, @down_left, @left_down, @left_up, @up_left]
  end

  def to_s
    "[#{col}, #{row}]"
  end

  def check_move(col, row)
    col.negative? || col > 7 || row.negative? || row > 7
  end

  def assign_possible_moves_right
    @up_right = [col + 1, row + 2] unless check_move(col + 1, row + 2)
    @right_up = [col + 2, row + 1] unless check_move(col + 2, row + 1)
    @right_down = [col + 2, row - 1] unless check_move(col + 2, row - 1)
    @down_right = [col + 1, row - 2] unless check_move(col + 1, row - 2)
  end

  def assign_possible_moves_left
    @down_left = [col - 1, row - 2] unless check_move(col - 1, row - 2)
    @left_down = [col - 2, row - 1] unless check_move(col - 2, row - 1)
    @left_up = [col - 2, row + 1] unless check_move(col - 2, row + 1)
    @up_left = [col - 1, row + 2] unless check_move(col - 1, row + 1)
  end
end
