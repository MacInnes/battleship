require './lib/tile'
require './lib/ship'

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
    if @board[row_1][column_1].ship? || @board[row_2][column_2].ship?
      return false
    elsif row_3
      return !@board[row_1][column_1].ship?
    end
    return true
  end




end