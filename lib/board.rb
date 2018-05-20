require './lib/tile'
require './lib/ship'
require 'pry'

class Board
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def self.construct
    board = 4.times.map do
      4.times.map do
        Tile.new
      end
    end
    new(board)
  end

  def place(ship, pos_1, pos_2, pos_3 = nil)
    board_key = {
      "A" => 0,
      "B" => 1,
      "C" => 2,
      "D" => 3
    }

    row_1 = board_key[pos_1.chars[0]]
    column_1 = pos_1.chars[1].to_i - 1

    row_2 = board_key[pos_2.chars[0]]
    column_2 = pos_2.chars[1].to_i - 1

    if pos_3
      row_3 = board_key[pos_3.chars[0]]
      column_3 = pos_3.chars[1].to_i - 1
      if verify_placement(row_1, column_1, row_2, column_2, row_3, column_3)      
        @board[row_1][column_1].ship = true
        @board[row_2][column_2].ship = true
        @board[row_3][column_3].ship = true
        return true
      else
        return false
      end
    elsif verify_placement(row_1, column_1, row_2, column_2)      
        @board[row_1][column_1].ship = true
        @board[row_2][column_2].ship = true
        return true
    else
      return false #????  everything else returns side effects, this doesn't make sense
    end

  end

  def verify_placement(row_1, column_1, row_2, column_2, row_3 = nil, column_3 = nil)

    # this checks if a ship has been placed on any tile already
    if @board[row_1][column_1].ship? || @board[row_2][column_2].ship?
      spot_taken = true
    elsif row_3
      spot_taken = @board[row_3][column_3].ship?
    end

    # this checks for a valid alignment
    if row_3
      if row_3 == row_1 && row_3 == row_2
        column_difference = (column_1 - column_2).abs
        column_difference_2 = (column_2 - column_3).abs
        aligned = column_difference == 1 && column_difference_2 == 1

      elsif column_3 == column_1 && column_3 == column_2
        row_difference = (row_1 - row_2).abs
        row_difference_2 = (row_2 - row_3).abs
        aligned = row_difference == 1 && row_difference_2 == 1
      else
        aligned = false
      end
    elsif row_1 == row_2
      column_difference = (column_1 - column_2).abs
      aligned = column_difference == 1
    elsif column_1 == column_2
      row_difference = (row_1 - row_2).abs
      aligned = row_difference == 1
    else
      aligned = false
    end
    return !spot_taken && aligned
  end




end