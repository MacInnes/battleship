class UserMoves

  def initialize
    @position_history = []
    
  end

  def move(board, position)
    if !@position_history.include? position
      board.shoot(position)
      @position_history << position
      return true
    else
      return false
    end
  end

end