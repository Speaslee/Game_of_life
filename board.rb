require 'pry'
require 'did_you_mean'

class Board
  attr_accessor :grid, :column, :row, :cell

  def initialize size

    @row = size
    @column = size
    @grid= Array.new(@column) {|y| Array.new(@row) {|x| Cells.new(x,y)}}

  end

  def neighbor cell #Tests correctly
    @neighbors = []
    x = cell.x
    y = cell.y
    (x-1..x+1).each do |rows|
      (y-1..y+1).each do |columns|
        next if rows == x && columns == y
        if rows >= 0 && columns >= 0 && rows < @row && columns < @column
          @neighbors.push([rows,columns])
        end
      end
    end
      @neighbors
end

def dead_or_alive(cell) #is what establishes the rules of the game for this program.
    living=[]

    @neighbors.each do |x,y|
      c = @grid[x][y]
      if c.live
        living.push(c)

      end
    end

  if cell.live #should check if the living cell has the correct number of living neighbors and kill it accordingly
      if living.count == 2 || living.count == 3
      cell.born
      else
        cell.die
      end

    else cell.live == false #should check if the living cell has the correct number of dead neighbors and birth it accordingly
      if living.count == 3
        cell.born
      else
        cell.die
      end
    end
#does not do what it is supposed to do. Not sure if I ever call this correctly. Is supposed to be called in the game file
update

end

def update

end
end

class Cells #as far as I can tell it does what it is supposed to do in the tests
  attr_accessor :alive, :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @alive = false
  end

  def live
    @alive
  end

  def born
    @alive = true
  end

  def die
    @alive = false
  end


end
