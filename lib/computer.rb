require './lib/board'
require './lib/ship'

class Computer
  attr_reader :board

  def initialize(board)
    @board = board
    @key = {
      0 => "A",
      1 => "B",
      2 => "C",
      3 => "D"
    }
    @move_history = []
  end

  def place(ship, board)
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
        end_column = start_column + offset
      end
    end

    if verify_placement(ship, start_row, start_column, end_row, end_column)
      start_point = @key[start_row] + (start_column + 1).to_s
      end_point = @key[end_row] + (end_column + 1).to_s
      @board.place(ship, start_point, end_point)
    else
      place(ship, board)
    end

  end

  def verify_placement(ship, start_row, start_column, end_row, end_column)
    if @board.board[start_row][start_column].ship? || @board.board[end_row][end_column].ship?
      return false
    end 
    if ship.length == 3
      mid_row = (start_row + end_row) / 2
      mid_column = (start_column + end_column) / 2
      return !@board.board[mid_row][mid_column].ship?
    end
    return true
  end

  def move(board)
    random = Random.new
    row = random.rand(4)
    column = random.rand(4) + 1
    position = @key[row] + column.to_s
    if !@move_history.include? position
      board.shoot(position)
      @move_history << position
    else
      move(board)
    end
  end

end