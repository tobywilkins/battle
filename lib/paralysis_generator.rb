class ParalysisGenerator

  def initialize(player)
    @player = player
  end

  def self.run(player)
    self.new(player).process_paralysis
  end

  def process_paralysis
    @player.paralyze
  end

end