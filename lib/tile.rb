

class Tile
  attr_accessor :ship,
                :status

  def initialize
    @ship = false
    @status = nil
  end

  def ship?
    @ship
  end

end