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

  def test_board_can_have_ships_placed_on_it
    board = Board.construct
    ship = Ship.new


    board.place(ship, "A1", "A2") # refactor to accept user/cpu argument?

    assert board.board[0][0].ship?
    assert board.board[0][1].ship?
    refute board.board[1][1].ship?

    ship_3 = Ship.new(3)

    board.place(ship_3, "B1", "B2", "B3")

    assert board.board[1][0].ship?
    assert board.board[1][1].ship?
    assert board.board[1][2].ship?
    refute board.board[1][3].ship?
  end

  def test_board_will_fail_invalidly_placed_ships

    board = Board.construct
    ship_1 = Ship.new
    ship_2 = Ship.new
    ship_3 = Ship.new(3)

    assert board.place(ship_1, "A1", "A2")
    refute board.place(ship_2, "A1", "A2")

    refute board.place(ship_1, "D1", "D1") # same tile
    refute board.place(ship_1, "B1", "B4") # wrap horizontally
    refute board.place(ship_1, "C4", "C1") # wrap vertically
    refute board.place(ship_1, "B2", "C3") # diagonal

    assert board.place(ship_3, "C1", "C2", "C3")
    refute board.place(ship_3, "A1", "B1", "C1")
    refute board.place(ship_3, "B1", "B2", "B4")
    refute board.place(ship_3, "A4", "B3", "C2")
  end

  def test_board_can_be_shot
    board = Board.construct
    ship = Ship.new

    board.place(ship, "A1", "A2")

    assert_nil board.board[0][0].status

    board.shoot("A1")

    assert_equal "H", board.board[0][0].status

    board.shoot("B1")

    assert_equal "M", board.board[1][0].status

  end

  def test_ship_can_be_sunk
    board = Board.construct
    ship = Ship.new

    board.place(ship, "A1", "A2")

    board.shoot("A1")
    board.shoot("A2")

    assert_equal ship, board.board[0][0].ship_name
    refute_equal ship, board.board[1][1].ship_name
  end


end
















