require './lib/board'
require './lib/tile'
require './lib/ship'
require './lib/computer'
require './lib/user'
require './lib/print_messages'

module Battleship

  def initial
    print = PrintMessages.new # refactor to module

    puts print.start_game
    input = gets.chomp.downcase

    if input == "p" || input == "play"
      true
    elsif input == "q" || input == "quit"
      return nil
    elsif input == "i" || input == "instructions"
      puts print.instructions
      initial
    end
  end

  def place_first(ship_1, ship_2, board, user)
    print = PrintMessages.new
    puts print.player_setup
    first_ship_input = gets.chomp.upcase
    first_ship_coordinates = separate_input(first_ship_input)

    if !user.place(ship_1, first_ship_coordinates[0], first_ship_coordinates[1], board)
      puts print.invalid_placement
      place_first(ship_1, ship_2, board, user) # same ?
    end
  end

  def place_second(ship_2, board, user)
    print = PrintMessages.new

    puts print.player_second_ship
    second_ship_input = gets.chomp.upcase
    second_ship_coordinates = separate_input(second_ship_input)
    if !user.place(ship_2, second_ship_coordinates[0], second_ship_coordinates[1], board)
      puts print.invalid_placement
      place_second(ship_2, board, user) # refactor loop?
    end

  end


  def user_turn(user, board)
    print = PrintMessages.new
    puts print.user_print_board(board)
    puts print.player_shot_prompt
    shot_location = gets.chomp.upcase
    result = board.shoot(shot_location)
    if result == "sunk"
      puts print.sunk
    elsif result == "H"
      puts print.hit
    elsif result == "M"
      puts print.miss
    end
  end

  def computer_turn(computer, board)
    print = PrintMessages.new
    result = computer.move(board)
    if result == "sunk"
      puts print.cpu_sunk
    elsif result == "H"
      puts print.cpu_hit
    elsif result == "M"
      puts print.cpu_miss
    end
    puts print.cpu_print_board(board)
  end

  def game_over?(board)
    total_hits = board.board.map do |row|
      row.select do |tile|
        tile.status == "H"
      end
    end.flatten.length
    return total_hits == 5
  end

  def separate_input(input)
    if input.split(" ").length == 2
      return input.split(" ")
    else
      puts print.invalid_input
      
    end
  end
end



















