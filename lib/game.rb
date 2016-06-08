require_relative 'player_model'

class Game

  attr_reader :player1, :player2, :turn_number, :defender, :game

  def self.store_game(game)
    @@game = game
  end

  def self.game
    @@game
  end

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
    return "#{ defender.name } loses" if game_over?
    @turn_number += 1
    "#{ defender.name } got attacked"
  end

  def game_over?
    defender.hp <= 0
  end

  def self.build(name1, name2)
    player1 = Player.new(name1)
    player2 = Player.new(name2)
    new(player1, player2)
  end

end
