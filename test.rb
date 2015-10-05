require "minitest/autorun"
require "./board"


class LifeTest < Minitest::Test
  def test_boards_can_have_varying_sizes #passes

    b = Board.new 3
    assert_equal 3, b.column
  end

  def test_are_there_neighbors #passes
    b = Board.new 10
    c = Cells.new(0,1)
    a = b.neighbor c
    assert_equal 5, a.count
  end

 def test_cell_be_born #passes
   b = Board.new 10
   c = Cells.new(0,1)
   refute c.live
   c.born
   assert c.live
 end

def test_cell_be_dead #probably unnecessary
  b = Board.new 10
  c = Cells.new(0,1)
  refute c.live
  c.born
  assert c.live
  c.die
  refute c.live
end

def test_patter_can_be_made #does not work
  b = Board.new 10
  c=Cells.new[[1,0],[1,1],[1,2]].born
  if b.each do |row|
    row.each {
      |cell| if cell.live print "O"
      else print "."
      end
    }
  end
end
end

end
