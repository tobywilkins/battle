# Knows its own hitpoints and name
class Player
  DEFAULT_HITPOINTS = 60
  attr_reader :name, :hitpoints, :latest_damage, :paralysis

  def initialize(name,hitpoints =DEFAULT_HITPOINTS)
    @name = name
    @hitpoints = hitpoints
    @latest_damage = nil
    @paralysis = false
  end

  def remove_hitpoints(amount)
    @hitpoints -= amount
    @latest_damage = amount
  end

  def paralyze
    @paralysis = true
  end
end
