class Node
  def initialize(start)
    @position = start
    @up_right = start.up.up.right
    @right_up = start.right.right.up
    @right_down = start.right.right.down
    @down_right = start.down.down.right
    @down_left = start.down.down.left
    @left_down =  start.left.left.down
    @left_up = start.left.left.up
    @up_left = start.up.up.left
  end
  
  def check_node_children(end_coord)
    case end_coord
    when [@up_right.col, @up_right.row] then true
    when [@right_up.col, @right_up.row] then true
    when [@right_down.col, @right_down.row] then true
    when [@down_right.col, @down_right.row] then true
    when [@down_left.col, @down_left.row] then true
    when [@left_down.col, @left_down.row] then true
    when [@left_up.col, @left_up.row] then true
    when [@up_left.col, @up_left.row] then true
    end
  end

  def create_children 
    Node.new 

    



end