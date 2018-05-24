class User
  attr_reader :board

  def initialize(board)
    @board = board
    @key = {
      "A" => 0,
      "B" => 1, 
      "C" => 2,
      "D" => 3
    }
    @position_history = []
  end

  def place(user_ship, pos_1, pos_2, board)
    return board.place(user_ship, pos_1, pos_2)
  end

  def move(board, position)
    if !@position_history.include? position && position.split(" ").length == 2
      board.shoot(position)
      @position_history << position
      return true
    else
      return false
    end
  end

end