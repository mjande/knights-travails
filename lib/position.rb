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
end
