class Player
  attr_reader :name, :hp, :paralyzed, :asleep, :poisoned, :last_action
  def initialize(name)
    @name = name
    @hp = 100
    @paralyzed = false
    @asleep = false
    @poisoned = false
    @last_action = nil
  end

  def poison
    @poisoned = true
  end

  def paralyze
    @paralyzed = true
  end

  def set_asleep
    @asleep = true
  end

  def cure
    @paralyzed = false
    @asleep = false
  end

  def deduct(x)
    @hp -= x
  end

  def heal
    @hp += (1 + Kernel.rand(10))
    @hp = 100 if hp > 100
  end

  def log(message)
    @last_action = message
  end
end
