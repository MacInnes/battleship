require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/board'
require './lib/tile'
require './lib/ship'
require './lib/user_moves'
require 'pry'

class UserMovesTest < Minitest::Test

  def test_exists
    user_moves = UserMoves.new

    assert_instance_of UserMoves, user_moves
  end

  def test_can_shoot_at_a_tile
    user_moves = UserMoves.new
    board = Board.construct

    assert_equal true, user_moves.move(board, "A1")

    actual = find_not_nil_tile_count(board)

    assert_equal 1, actual

    assert_equal "M", board.board[0][0].status

  end

  def test_cannot_shoot_at_a_tile_already_shot_at
    user_moves = UserMoves.new
    board = Board.construct

    assert_equal true, user_moves.move(board, "A1")
    assert_equal false, user_moves.move(board, "A1")
  end

  def find_not_nil_tile_count(board)
    return board.board.map do |row|
      row.select do |tile|
        tile.status != nil
      end
    end.flatten.length
  end

end