require './lib/tile'
require './lib/ship'
require 'pry'

class Board
  attr_reader :board

  def initialize(board)
    @board = board
    @board_key = {
      "A" => 0,
      "B" => 1,
      "C" => 2,
      "D" => 3
    }
  end

  def self.construct
    board = 4.times.map do
      4.times.map do
        Tile.new
      end
    end
    new(board)
  end

  def place(ship, pos_1, pos_2)
    start_row = @board_key[pos_1.chars[0]]
    start_column = pos_1.chars[1].to_i - 1
    end_row = @board_key[pos_2.chars[0]]
    end_column = pos_2.chars[1].to_i - 1

    if ship.length === 3
      if start_row == end_row
        mid_row = start_row
        mid_column = (end_column + start_column) / 2
      else
        mid_column = start_column
        mid_row = (end_row + start_row) / 2
      end
    end

    if verify_placement(ship, pos_1, pos_2)
      @board[start_row][start_column].ship = true
      @board[start_row][start_column].ship_name = ship
      @board[end_row][end_column].ship = true
      @board[end_row][end_column].ship_name = ship
      if ship.length == 3
        @board[mid_row][mid_column].ship = true
        @board[mid_row][mid_column].ship_name = ship
      end
      return true
    end
    return false
  end

  def verify_placement(ship, pos_1, pos_2)
    start_row = @board_key[pos_1.chars[0]]
    start_column = pos_1.chars[1].to_i - 1
    end_row = @board_key[pos_2.chars[0]]
    end_column = pos_2.chars[1].to_i - 1


    valid_choice = true
    not_diagonal = true
    correct_spacing = true
    no_ships = true

    offset = ship.length - 1

    if ship.length === 3
      if start_row == end_row
        mid_row = start_row
        mid_column = (end_column + start_column) / 2
      else
        mid_column = start_column
        mid_row = (end_row + start_row) / 2
      end
      if @board[mid_row][mid_column].ship?
        no_ships = false
      end
    end

    if @board[start_row][start_column].ship? || @board[end_row][end_column].ship?
      no_ships = false
    end

    if !start_column.between?(0,3) || !end_column.between?(0,3) || start_row == nil || end_row == nil
      valid_choice = false
    end

    if start_row == end_row # horizontal
      if (start_column - end_column).abs != offset
        correct_spacing = false
      end
    elsif start_column == end_column # vertical
      if (start_row - end_row).abs != offset
        correct_spacing = false
      end
    else
      not_diagonal = false
    end

    return valid_choice && not_diagonal && correct_spacing && no_ships

  end

  def shoot(position)
    row = @board_key[position.chars[0]]
    column = position.chars[1].to_i - 1
    
    
    if @board[row][column].ship?
      @board[row][column].status = "H"
      @board[row][column].ship_name.hit
    else
      @board[row][column].status = "M"
    end
  end
end










