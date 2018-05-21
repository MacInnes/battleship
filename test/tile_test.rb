require './test/test_helper'
require './lib/tile'
require './lib/ship'

class TileTest < Minitest::Test

  def test_exists
    skip
    tile = Tile.new

    assert_instance_of Tile, tile
  end

  def test_ship_exists_defaults_to_false
    skip
    tile = Tile.new

    refute tile.ship?
  end

  def test_can_reassign_ship_to_true
    skip
    tile = Tile.new

    tile.ship = true

    assert tile.ship?
  end

  def tile_status_defaults_to_nil
    tile = Tile.new

    assert_nil tile.status
  end

  def test_tile_status_can_change
    skip
    tile = Tile.new

    tile.status = "H"

    assert_equal "H", tile.status

    tile.status = "M"

    assert_equal "M", tile.status
  end

  def test_ship_name_defaults_to_nil
    skip
    tile = Tile.new

    assert_nil tile.ship_name
  end

  def test_ship_name_can_be_reassigned
    skip

    tile = Tile.new
    ship = Ship.new
    tile.ship_name = ship
    assert_equal ship, tile.ship_name
  end


end
