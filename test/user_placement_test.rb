require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/board'
require './lib/tile'
require './lib/ship'
require './lib/computer_placement'
require './lib/user_placement'
require 'pry'

class UserPlacementTest < Minitest::Test
  
  def test_exists
    user_placement = UserPlacement.new

    assert_instance_of UserPlacement, user_placement
  end

  def test_user_can_place_ships_on_board
    user_placement = UserPlacement.new
    board = Board.construct
    user_ship = Ship.new

    assert_equal true, user_placement.place_ship(user_ship, "A1", "A2", board)

    actual = find_ship_tile_count(board)

    assert_equal 2, actual
  end

  def test_user_can_place_3_length_ships_on_board
    user_placement = UserPlacement.new
    board = Board.construct
    user_ship = Ship.new(3)

    assert_equal true, user_placement.place_ship(user_ship, "A1", "A3", board)

    actual = find_ship_tile_count(board)

    assert_equal 3, actual
  end

  def find_ship_tile_count(board)
    board.board.map do |row|
      row.select do |tile|
        tile.ship?
      end
    end.flatten.length
  end

end