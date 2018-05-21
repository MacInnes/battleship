class ComputerMoves
  def initialize
    @inverse_key = {
      0 => "A",
      1 => "B",
      2 => "C",
      3 => "D"
    }

    @position_history = []
  end
  
  def move(board)
    random = Random.new
    row = random.rand(4)
    column = random.rand(4) + 1
    position = @inverse_key[row] + column.to_s
    if !@position_history.include? position
      board.shoot(position)
      @position_history << position
    else
      move(board)
    end
  end


end