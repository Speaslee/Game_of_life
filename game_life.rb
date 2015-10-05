require "./board"


class Pattern
  attr_accessor :board, :cells

def initialize size
  @board= Board.new(size)
  @initial_pattern =[[1,0],[1,1],[1,2]]
  @initial_patern.born
end

def next
  @board.neighbor(cell)
  @board.dead_or_alive

end
end
g= Pattern.new (4)
Pattern.next.times (5)
