require './test/test_helper'
require './lib/ship'


class ShipTest < Minitest::Test

  def test_exists
    

    ship = Ship.new

    assert_instance_of Ship, ship
  end

  def test_length_can_be_assigned_as_argument
    

    ship_2 = Ship.new
    ship_3 = Ship.new(3)

    assert_equal 2, ship_2.length
    assert_equal 3, ship_3.length
  end

  def test_can_be_hit
    

    ship = Ship.new
    ship.hit

    assert_equal 1, ship.hits
  end

  def test_can_be_sunk
    

    ship = Ship.new
    ship.hit

    refute ship.sunk?

    ship.hit

    assert ship.sunk?
  end

end
















