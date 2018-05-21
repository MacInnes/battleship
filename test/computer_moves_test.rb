require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/board'
require './lib/tile'
require './lib/ship'
require './lib/computer_placement'
require './lib/computer_moves'

class ComputerMovesTest < Minitest::Test
  def test_exists
    computer_moves = ComputerMoves.new

    assert_instance_of ComputerMoves, computer_moves
  end

  def test_picks_a_tile_and_shoots_at_it
    computer_moves = ComputerMoves.new
    board = Board.construct

    computer_moves.move(board)

    actual = find_not_nil_tile_count(board)

    assert_equal 1, actual
  end

  def test_will_not_shoot_at_tile_already_shot
    computer_moves = ComputerMoves.new
    board = Board.construct

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
    return board.board.map do |row|
      row.select do |tile|
        tile.status != nil
      end
    end.flatten.length
  end

end