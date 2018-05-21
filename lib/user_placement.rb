class UserPlacement
  
  def initialize

  end

  def place_ship
    @board_key = {
      "A" => 0,
      "B" => 1, 
      "C" => 2,
      "D" => 3
    }
  end

  def place_ship(user_ship, pos_1, pos_2, board)
    return board.place(user_ship, pos_1, pos_2)
  end

end