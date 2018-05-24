require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/computer'
require './lib/user'
require './lib/board'
require './lib/ship'
require './lib/print_messages'

class RunnerTest < Minitest::Test
  
  def test_everything
    user_board = Board.construct
    cpu_board = Board.construct
    
    user_2_ship = Ship.new
    cpu_2_ship = Ship.new
    user_3_ship = Ship.new(3)
    cpu_3_ship = Ship.new(3)

    user = User.new(user_board)
    computer = Computer.new(cpu_board)

    user.place(user_2_ship, "A1", "A2", user_board)
    user.place(user_3_ship, "C1", "C3", user_board)

    computer.place(cpu_2_ship, cpu_board)
    computer.place(cpu_3_ship, cpu_board)

    assert_equal 5, find_ship_tile_count(user_board)
    assert_equal 5, find_ship_tile_count(cpu_board)

    user.move(cpu_board, "B2")

    assert_equal 1, find_not_nil_tile_count(cpu_board) # I can't know if this will be a hit or a miss due to the random cpu placement

    computer.move(user_board)

    assert_equal 1, find_not_nil_tile_count(user_board)

    user.move(cpu_board, "A1")

    assert_equal 2, find_not_nil_tile_count(cpu_board)


  end

  def find_ship_tile_count(board)
    board.board.map do |row|
      row.select do |tile|
        tile.ship?
      end
    end.flatten.length
  end

  def find_hit_tile_count(board)
    board.board.map do |row|
      row.select do |tile|
        tile.status == "H"
      end
    end.flatten.length
  end

  def find_miss_tile_count(board)
    board.board.map do |row|
      row.select do |tile|
        tile.status == "M"
      end
    end.flatten.length
  end

  def find_not_nil_tile_count(board)
    board.board.map do |row|
      row.select do |tile|
        tile.status != nil
      end
    end.flatten.length
  end

end