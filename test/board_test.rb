require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/tile'

class BoardTest < Minitest::Test

  def test_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_board_defaults_to_empty_array
    board = Board.new

    assert_equal [], board.board
  end

  def test_constructs_2D_array_of_tiles
    board = Board.new
    board.construct

    assert_equal 4, board.board.length
    assert_equal 4, board.board[0].length
    assert_equal Tile, board.board[0][0].class
  end

end