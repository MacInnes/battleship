require "./lib/board"
require "./lib/tile"
require "./lib/ship"
require "pry"

class ComputerPlacement

  def initialize

    @key = {
      0 => "A",
      1 => "B",
      2 => "C",
      3 => "D"
    }
  end
  
  def place_ship(ship, board)
    random = Random.new

    choose_vert_vs_horizontal = random.rand(2)
    start_row = random.rand(4)
    start_column = random.rand(4)
    
    offset = ship.length - 1
    if choose_vert_vs_horizontal == 0 # vertical
      end_column = start_column
      if (start_row + offset) > 3
        end_row = 3
        start_row = 3 - offset
      else
        end_row = start_row + offset
      end
    else # horizontal
      end_row = start_row
      if (start_column + offset) > 3
        end_column = 3
        start_column = 3 - offset
      else
        end_column = start_column + offsetg
      end
    end

    start_point = @key[start_row] + (start_column + 1).to_s
    end_point = @key[end_row] + (end_column + 1).to_s

    board.place(ship, start_point, end_point)

  end

end