class Tile
  attr_accessor :ship,
                :status,
                :ship_name

  def initialize
    @ship = false
    @status = nil
    @ship_name = nil
  end

  def ship?
    @ship
  end

end