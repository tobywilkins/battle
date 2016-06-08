require_relative 'player_model'

class Game

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def attack(defender)
    defender.deduct(10)
    "#{ defender.name } got attacked"
  end

end
