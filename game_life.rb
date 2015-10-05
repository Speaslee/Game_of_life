require "./board"


class Pattern
  attr_accessor :board, :cells

def initialize size
  @board= Board.new(size)
  @initial_pattern =[[1,0],[1,1],[1,2]] #should be a blinker
  @initial_patern.born
end

def next_shape
  @board.neighbor(cell).dead_or_alive
  
end
end
g= Pattern.new (4)
Pattern.next_shape.times (5) #That should make it rotate
