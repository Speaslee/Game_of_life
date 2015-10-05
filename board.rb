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

  def display
    @grid.each do |row|
      row.each {
        |cell| if cell.live print "O"
        else print "."
        end
      }
      puts
    end
  end


  def neighbor cell
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

def dead_or_alive
    living=[]
    @neighbors.each do |cell|
      if cell.live
        living.push(cell)
      end
    end

    if cell.live
      if living.count == 2 || living.count == 3
        cell.born
      else
        cell.die
      end

    else cell.live == false
      if living.count == 3
        cell.born
      else
        cell.die
      end
    end

  end
end



class Cells
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
