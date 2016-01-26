require "./board"


class Pattern
  attr_accessor :board, :cells

  def initialize size
    @board= Board.new(size)
    @initial_pattern =[[3,1],[3,2],[3,3],[1,2],[2,3]] #should be a blinker
    @initial_pattern.each do |x,y|
      cell = @board.grid[x][y]
      cell.born
    end
  end

  def next_shape
    @board.grid.each do |row|
      row.each do |cell|
        @board.neighbor(cell)
        @board.dead_or_alive(cell)
      end
    end
    @board.update
  end
  def display #should go through each cell of the array and check if it is alive or dead and print the appropriate symbol
    #does not do what it should do. Maybe should be in the game_life.rb but wasn't working there either.
    @board.grid.each do |row|
      row.each {
        |cell| if cell.live
          print "O"
        else print "."
        end
      }
      puts
    end
  end
end
g= Pattern.new (7)
10.times do
  g.next_shape
  system "clear"
  g.display #That should make it rotate

  sleep 1
end
