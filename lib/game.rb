require_relative 'player_model'

class Game

  attr_reader :player1, :player2, :turn_number, :defender

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @defender
    @turn_number = 1
  end

  def attack
    @defender = set_defender
    defender.deduct(10)
    end_turn
  end

  def player_turn
    return @player1 if turn_number.odd?
    @player2
  end

  def set_defender
    player_turn == player2 ? player1 : player2
  end

  def end_turn
    @turn_number += 1
    "#{ defender.name } got attacked"
  end

end
