class Player
  attr_reader :name, :hp
  def initialize(name)
    @name = name
    @hp = 100
  end

  def deduct(x)
    @hp -= x
  end
end
