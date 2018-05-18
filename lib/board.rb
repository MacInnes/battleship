require './lib/tile'
require './lib/ship'

class Board
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def self.construct
    board = []
    4.times do
      temp = []
      4.times do
        tile = Tile.new
        temp << tile
      end
      board << temp
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

    row_1 = pos_1[0]
    column_1 = pos_1[1]

  end

end