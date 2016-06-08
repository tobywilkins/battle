class AttackGenerator

  def initialize(player)
    @player = player
  end

  def self.run(player)
    self.new(player).process_attack
  end

  def process_attack
    damage = 5+ rand(10)
    @player.remove_hitpoints(damage)
  end

end