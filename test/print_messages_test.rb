require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/print_messages'
require './lib/board'

class PrintMessagesTest < Minitest::Test
  
  def test_exists
    print_messages = PrintMessages.new

    assert_instance_of PrintMessages, print_messages
  end

  def test_start_game_message
    print_messages = PrintMessages.new

    expected = "Welcome to BATTLESHIP

Would you like to (p)lay, read the (i)nstructions, or (q)uit?
>"

    assert_equal expected, print_messages.start_game
  end

  def test_player_setup
    print_messages = PrintMessages.new

    expected = "I have laid out my ships on the grid.
You now need to layout your two ships.
The first is two units long and the
second is three units long.
The grid has A1 at the top left and D4 at the bottom right.

Enter the squares for the two-unit ship:"

    assert_equal expected, print_messages.player_setup
  end

  def test_player_second_ship
    print_messages = PrintMessages.new

    expected = "Enter the squares (beginning and end) for the three-unit ship:"

    assert_equal expected, print_messages.player_second_ship
  end

  def test_invalid_placement
    print_messages = PrintMessages.new

    expected = "Invalid ship placement, please try again:"

    assert_equal expected, print_messages.invalid_placement
  end

  def test_player_shot_prompt
    print_messages = PrintMessages.new

    expected = "Please enter the coordinates of your shot:"

    assert_equal expected, print_messages.player_shot_prompt
  end

  def test_invalid_shot
    print_messages = PrintMessages.new

    expected = "Invalid shot selection, please choose again:"

    assert_equal expected, print_messages.invalid_shot
  end

  def test_hit
    print_messages = PrintMessages.new

    expected = "You hit a ship!"

    assert_equal expected, print_messages.hit
  end

  def test_miss
    print_messages = PrintMessages.new

    expected = "Your shot missed."

    assert_equal expected, print_messages.miss
  end

  def test_sunk
    print_messages = PrintMessages.new

    expected = "You sunk a ship!"

    assert_equal expected, print_messages.sunk
  end

  def test_computer_hit
    print_messages = PrintMessages.new

    expected = "The computer hit one of your ships!"

    assert_equal expected, print_messages.cpu_hit
  end

  def test_computer_miss
    print_messages = PrintMessages.new

    expected = "The computer missed."

    assert_equal expected, print_messages.cpu_miss
  end

  def test_computer_sunk
    print_messages = PrintMessages.new

    expected = "The computer sunk one of your ships!"

    assert_equal expected, print_messages.cpu_sunk
  end

  def test_player_won
    print_messages = PrintMessages.new
    board = Board.construct

    board.shoot("A1")
    board.shoot("A2")
    board.shoot("B1")
    board.shoot("B2")
    board.shoot("B3")

    expected = "You won! It took you 5 shots to win."

    assert_equal expected, print_messages.player_win(board)
  end

  def test_cpu_won
    print_messages = PrintMessages.new
    board = Board.construct

    board.shoot("A1")
    board.shoot("A2")
    board.shoot("B1")
    board.shoot("B2")
    board.shoot("B3")

    expected = "The computer won, it took 5 shots to win."

    assert_equal expected, print_messages.cpu_win(board)
  end

  def test_print_board
    board = Board.construct
    print_messages = PrintMessages.new

    expected_initial = "===========
. 1 2 3 4
A        
B        
C        
D        
==========="
    assert_equal expected_initial, print_messages.print_board(board)

    board.shoot("A1")

    expected_after_shot = "===========
. 1 2 3 4
A M      
B        
C        
D        
==========="

    assert_equal expected_after_shot, print_messages.print_board(board)

    board.shoot("B2")

    expected_after_two_shots = "===========
. 1 2 3 4
A M      
B   M    
C        
D        
==========="

    assert_equal expected_after_two_shots, print_messages.print_board(board)  

  end



end


















