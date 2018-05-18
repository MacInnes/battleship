require './test/test_helper'
require './lib/board'
require './lib/tile'
require './lib/ship'

class BoardTest < Minitest::Test

  def test_exists
    board = Board.construct

    assert_instance_of Board, board
  end

  def test_constructs_2D_array_of_tiles
    board = Board.construct

    assert_equal 4, board.board.length
    assert_equal 4, board.board[0].length
    assert_equal Tile, board.board[0][0].class
  end

  # def test_board_can_have_ships_placed_on_it
  #   board = Board.construct
  #   ship = Ship.new


  #   board.place(ship, "A1", "A2") # refactor to accept user/cpu argument?

  #   assert board.board[0][0].ship?
  #   assert board.board[0][1].ship?
  #   refute board.board[1][1].ship?
  # end


end
















