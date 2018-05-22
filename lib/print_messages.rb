require 'pry'

class PrintMessages

  def start_game
    "Welcome to BATTLESHIP

Would you like to (p)lay, read the (i)nstructions, or (q)uit?
>"
  end

  def player_setup
    "I have laid out my ships on the grid.
You now need to layout your two ships.
The first is two units long and the
second is three units long.
The grid has A1 at the top left and D4 at the bottom right.

Enter the squares for the two-unit ship:"
  end

  def player_second_ship
    "Enter the squares (beginning and end) for the three-unit ship:"
  end

  def print_board(board)
    output = [["==========="], [". 1 2 3 4"], ["A"], ["B"], ["C"], ["D"], ["==========="]]

    populate_line(output[2], board.board[0])
    populate_line(output[3], board.board[1])
    populate_line(output[4], board.board[2])
    populate_line(output[5], board.board[3])


    output.map do |line|
      line.join(" ")
    end.join("\n")
  end

  def populate_line(output_row, board_row)
    board_row.each do |tile|
      if tile.status
        output_row << tile.status
      else
        output_row << " "
      end
    end
  end




end