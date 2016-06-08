class AttackGenerator

  def initialize(player)
    @player = player
  end

  def self.run(player)
    self.new(player).process_attack
  end

  def process_attack
    @player.remove_hitpoints(10)
  end

end