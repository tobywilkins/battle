class Player
  attr_reader :name, :hp, :paralyzed, :asleep
  def initialize(name)
    @name = name
    @hp = 100
    @paralyzed = false
    @asleep = false
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
end
