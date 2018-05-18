require './lib/tile'

class Board
  attr_reader :board

  def initialize
    @board = []
  end

  def construct
    4.times do
      temp = []
      4.times do
        tile = Tile.new
        temp << tile
      end
      @board << temp
    end
  end


end