require "minitest/autorun"
require "./board"


class LifeTest < Minitest::Test
  def test_boards_can_have_varying_sizes

    b = Board.new 3
    assert_equal 3, b.column
  end

  def test_neighbors
    b = Board.new 10
    c = Cells.new(0,1)
    a = b.neighbors c

    assert_equal 5, a.count
  end
end
