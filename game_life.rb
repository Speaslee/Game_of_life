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
def display #should go through each cell of the array and check if it is alive or dead and print the appropriate symbol
  #does not do what it should do. Maybe should be in the game_life.rb but wasn't working there either.
  @grid.each do |row|
    row.each {
      |cell| if cell.live print "O"
      else print "."
      end
    }
    puts
  end
end
end
g= Pattern.new (4)
Pattern.next_shape.display.times(5) #That should make it rotate
