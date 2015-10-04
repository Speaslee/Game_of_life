require "minitest/autorun"
require "./board"


class LifeTest < Minitest::Test
  def test_boards_can_have_varying_sizes

    b = Board.new 3
    assert_equal 3, b.column
  end

  def test_are_there_neighbors
    b = Board.new 10
    c = Cells.new(0,1)
    a = b.neighbor c
    assert_equal 5, a.count
  end

 def test_cell_be_born
   b = Board.new 10
   c = Cells.new(0,1)
   refute c.alive?
   c.born
   assert c.alive?
 end

def test_cell_be_dead
  b = Board.new 10
  c = Cells.new(0,1)
  refute c.alive?
  c.born
  assert c.alive?
  c.die
  refute c.alive?
end

end
