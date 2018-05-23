require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/board'
require './lib/tile'
require './lib/ship'
require './lib/user'
require 'pry'

class UserTest < Minitest::Test

  def test_initializes_with_empty_board
    board = Board.construct
    user = User.new(board)

    assert_equal board, user.board
  end

  def test_user_can_place_ships_on_board
    board = Board.construct
    user = User.new(board)
    user_ship = Ship.new

    assert_equal true, user.place(user_ship, "A1", "A2", board)

    actual = find_ship_tile_count(board)

    assert_equal 2, actual
  end

  def test_user_can_place_3_length_ship
    board = Board.construct
    user = User.new(board)
    user_ship = Ship.new(3)

    assert_equal true, user.place(user_ship, "A1", "A3", board)

    actual = find_ship_tile_count(board)

    assert_equal 3, actual
  end

  def test_can_shoot_at_a_tile
    board = Board.construct
    user = User.new(board)

    assert_equal true, user.move(board, "A1")

    actual = find_not_nil_tile_count(board)

    assert_equal 1, actual

    assert_equal "M", board.board[0][0].status

  end

  def test_cannot_shoot_at_a_tile_already_shot_at
    board = Board.construct
    user = User.new(board)

    assert_equal true, user.move(board, "A1")
    assert_equal false, user.move(board, "A1")
  end

  def find_ship_tile_count(board)
    board.board.map do |row|
      row.select do |tile|
        tile.ship?
      end
    end.flatten.length
  end

  def find_not_nil_tile_count(board)
    return board.board.map do |row|
      row.select do |tile|
        tile.status != nil
      end
    end.flatten.length
  end

end