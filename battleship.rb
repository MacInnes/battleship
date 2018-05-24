require './lib/board'
require './lib/tile'
require './lib/ship'
require './lib/computer'
require './lib/user'
require './lib/print_messages'

require './game'

include Battleship

if initial
  print = PrintMessages.new
  user_board = Board.construct
  cpu_board = Board.construct
  
  user_2_ship = Ship.new
  cpu_2_ship = Ship.new
  user_3_ship = Ship.new(3)
  cpu_3_ship = Ship.new(3)

  user = User.new(user_board)
  computer = Computer.new(cpu_board)

  computer.place(cpu_2_ship, cpu_board)
  computer.place(cpu_3_ship, cpu_board)

  place_first(user_2_ship, user_3_ship, user_board, user)
  place_second(user_3_ship, user_board, user)

  loop do
    user_turn(user, cpu_board)
    if game_over?(cpu_board)
      # win 
      puts print.player_win(cpu_board)
      break
    else computer_turn(computer, user_board)
      if game_over?(user_board)
        # lose
        puts print.cpu_win(user_board)
        break
      end
    end
  end
end