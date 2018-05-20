require './test/test_helper'
require './lib/tile'

class TileTest < Minitest::Test

  def test_exists
    tile = Tile.new

    assert_instance_of Tile, tile
  end

  def test_ship_exists_defaults_to_false
    tile = Tile.new

    refute tile.ship?
  end

  def test_can_reassign_ship_to_true
    tile = Tile.new

    tile.ship = true

    assert tile.ship?
  end

  def tile_status_defaults_to_nil
    tile = Tile.new

    assert_nil tile.status
  end

  def test_tile_status_can_change
    tile = Tile.new

    tile.status = "H"

    assert_equal "H", tile.status

    tile.status = "M"

    assert_equal "M", tile.status
  end

  def test_ship_name_defaults_to_nil
    tile = Tile.new

    assert_nil tile.ship_name
  end

  def test_ship_name_can_be_reassigned
    tile = Tile.new
    tile.ship_name = "Boaty McBoatFace"

    assert_equal "Boaty McBoatFace", tile.ship_name
  end

end
