class Position
  attr_reader :col, :row
  attr_accessor :up_right, :right_up, :right_down, :down_right, :down_left, :left_down, :left_up, :up_left

  def initialize(col, row)
    @col = col
    @row = row
    @up_right = nil
    @right_up = nil
    @right_down = nil
    @down_right = nil
    @down_left = nil
    @left_down = nil
    @left_up = nil
    @up_left = nil
    @possible_moves = [@up_right, @right_up, @right_down, @down_right, @down_left, @left_down, @left_up, @up_left]
  end

  def to_s
    "[#{col}, #{row}]"
  end

  def print_moves
    @possible_moves.each { |position| puts "[#{position.col}, #{position.row}" }
  end
end
