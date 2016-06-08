# Knows its own hitpoints and name
class Player
  DEFAULT_HITPOINTS = 60
  attr_reader :name, :hitpoints

  def initialize(name,hitpoints =DEFAULT_HITPOINTS)
    @name = name
    @hitpoints = hitpoints
  end

  def remove_hitpoints(amount)
    @hitpoints -= amount
  end
end
