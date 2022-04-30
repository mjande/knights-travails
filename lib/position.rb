class Position
  attr_reader :col, :row
  attr_accessor :knight, :up, :down, :left, :right

  def initialize(col, row)
    @col = col
    @row = row
    @knight = false
    @up = nil
    @down = nil
    @left = nil
    @right = nil
  end

  def to_s
    "[#{col}, #{row}]"
  end

  def add_knight_moves
    @up_right = start.up.up.right
    @right_up = start.right.right.up
    @right_down = start.right.right.down
    @down_right = start.down.down.right
    @down_left = start.down.down.left
    @left_down = start.left.left.down
    @left_up = start.left.left.up
    @up_left = start.up.up.left
    @possible_moves = [@up_right.to_s, @right_up.to_s, @right_down.to_s, @down_right.to_s, @down_left.to_s, @left_down.to_s, @left_up.to_s, @up_left.to_s]
  end
end
