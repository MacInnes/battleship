require 'minitest/autorun'
require 'minitest/pride'
require './test/board_test'
require './test/tile_test'
require './test/ship_test'
require './test/computer_test'
require './test/user_test'
require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start
  