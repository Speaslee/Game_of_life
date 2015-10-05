require 'pry'
require 'did_you_mean'

class Board
  attr_accessor :grid, :column, :row, :cell

  def initialize size

    @row = size
    @column = size
    @grid= Array.new(@column) {|y| Array.new(@row) {|x| Cells.new(x,y)}}
    display
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


  def neighbor cell #Tests correctly
    @neighbors = []
    x = cell.x
    y = cell.y
    (x-1..x+1).each do |rows|
      (y-1..y+1).each do |columns|
        next if rows == x && columns == y
        if rows >= 0 && columns >= 0
          @neighbors.push([rows,columns])
        end
      end
    end
      @neighbors
end

def dead_or_alive #is what establishes the rules of the game for this program.
    living=[]
    @neighbors.each do |cell|
      if cell.live
        living.push(cell)
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
  end
end



class Cells #as far as I can tell it does what it is supposed to do in the tests
  attr_accessor :alive, :x, :y, :live

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
