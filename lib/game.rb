require_relative 'player_model'
require_relative 'attack'

class Game # Knows about turns

  attr_reader :player1, :player2, :turn_number, :defender, :game, :attacker

  def self.store_game(game)
    @@game = game
  end

  def self.game
    @@game
  end

  def initialize(player1, player2,attack_gen = Attack.new)
    @player1 = player1
    @player2 = player2
    @defender = player2
    @attacker = player1
    @turn_number = 1
    @attack_gen = attack_gen
    @attacks = ["default_attack","poison_attack","sleep_attack","heal"]
  end

  def attack_random
    p attack(attacks.sample)
  end

  def attack(type)
    suffer_poison if attacker.poisoned

    @attack_gen.send(type,@defender,@attacker) if able_to_fight?
    defender.log ("#{ attacker.name } is #{condition} and couldn't attack!") unless able_to_fight?
    end_turn
  end

  def able_to_fight?
    !attacker.paralyzed && !attacker.asleep && attacker.hp > 0
  end

  def condition
    return "asleep" if attacker.asleep
    return "paralyzed" if attacker.paralyzed
    "unconscious" if attacker.hp <= 0
  end

  def player_turn
    return @player1 if turn_number.odd?
    @player2
  end

  def set_combatants
    @defender = (@player2 == player_turn ? @player1 : @player2)
    @attacker = (@player1 == player_turn ? @player1 : @player2)
  end

  def end_turn
    return "#{ defender.name } loses" if game_over?
    clean_up
    @turn_number += 1
    set_combatants
    attacker.last_action
  end

  def clean_up
    attacker.cure
  end

  def game_over?
    defender.hp <= 0
  end

  def self.build(name1, name2)
    player1 = Player.new(name1)
    player2 = Player.new(name2)
    new(player1, player2)
  end

  private

  attr_reader :attacks

  def suffer_poison
    @attack_gen.suffer_poison(attacker)
  end

end
