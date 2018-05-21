require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/board'
require './lib/tile'
require './lib/ship'
require './lib/computer_placement'
require 'pry'


class ComputerPlacementTest < Minitest::Test
  def test_exists
    computer = ComputerPlacement.new

    assert_instance_of ComputerPlacement, computer
  end

  def test_selects_two_valid_points
    board = Board.construct

    computer_placement = ComputerPlacement.new
    cpu_ship = Ship.new

    computer_placement.place_ship(cpu_ship, board)

    actual = board.board.map do |row|
      row.select do |tile|
        tile.ship_name == cpu_ship
      end
    end.flatten.length
    # binding.pry
    assert_equal 2, actual
  end

  def test_selects_three_valid_points

  end

end