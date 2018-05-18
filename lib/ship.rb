class Ship
  attr_reader :length,
              :hits

  def initialize(length = 2)
    @length = length
    @hits = 0
  end

  def hit
    @hits += 1
  end

  def sunk?
    return @hits == length 
  end

end