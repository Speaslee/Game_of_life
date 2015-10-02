require "./board"

class Pattern
  attr_accessor :board, :cells

def initialize size
  @board= Board.new(size)

  (1..size).each do |row|
     str = ""
     (1..size).each do |col|

         str += "x"
     end
     puts str
   end
 end

def next
  living_cells = []
  dead_cells = []
end
end
g= Pattern.new (4)
