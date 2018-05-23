require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/board'
require './lib/tile'
require './lib/ship'
require './lib/computer'
require 'pry'

class ComputerTest < Minitest::Test

  def test_initializes_with_empty_board
    board = Board.construct
    computer = Computer.new(board)

    assert_equal board, computer.board
  end

  def test_place_selects_two_valid_points
    board = Board.construct

    computer = Computer.new(board)
    cpu_ship = Ship.new

    computer.place(cpu_ship, board)

    actual = find_ship_tile_count(board)
    # binding.pry
    assert_equal 2, actual
  end

  def test_selects_three_valid_points
    board = Board.construct

    computer = Computer.new(board)
    cpu_ship = Ship.new(3)

    computer.place(cpu_ship, board)

    actual = find_ship_tile_count(board)
    # binding.pry
    assert_equal 3, actual
  end

  def test_picks_a_tile_and_shoots_at_it
    board = Board.construct
    computer = Computer.new(board)

    computer.move(board)

    actual = find_not_nil_tile_count(board)

    assert_equal 1, actual
  end

  def test_will_not_shoot_at_tile_already_shot
    board = Board.construct
    computer_moves = Computer.new(board)

    computer_moves.move(board)
    computer_moves.move(board)

    actual = find_not_nil_tile_count(board)

    assert_equal 2, actual

    computer_moves.move(board)

    actual = find_not_nil_tile_count(board)

    assert_equal 3, actual

    computer_moves.move(board)
    computer_moves.move(board)
    computer_moves.move(board)
    computer_moves.move(board)

    actual = find_not_nil_tile_count(board)

    assert_equal 7, actual

  end

  def find_not_nil_tile_count(board)
    board.board.map do |row|
      row.select do |tile|
        tile.status != nil
      end
    end.flatten.length
  end

  def find_ship_tile_count(board)
    board.board.map do |row|
      row.select do |tile|
        tile.ship?
      end
    end.flatten.length
  end

end