require_relative 'player_model'

class Game

  attr_reader :player1, :player2, :turn_number, :defender, :game, :attacker

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
    @attacker
    @final_message
    @turn_number = 1
  end

  def attack(type)
    set_combatants
    suffer_poison if attacker.poisoned
    if able_to_fight?
      attack_selector(type)
    else
      @final_message = "#{ attacker.name } is #{condition} and couldn't attack!"
    end
    end_turn
  end

  def attack_selector(type)
    default_attack if type == "attack"
    sleep_attack if type == "sleep"
    poison_attack if type == "poison"
  end

  def able_to_fight?
    !attacker.paralyzed && !attacker.asleep && attacker.hp > 0
  end

  def condition
    return "asleep" if attacker.asleep
    return "paralyzed" if attacker.paralyzed
    "unconscious" if attacker.hp <= 0
  end

  def default_attack
    damage = 5 + rand(11)
    defender.deduct(damage)
    defender.paralyze if rand(10) < 2
    @final_message = "#{ defender.name } got attacked"
  end

  def paralyze
    defender.paralyze
  end

  def sleep_attack
    defender.set_asleep
    @final_message = "#{ defender.name } fell asleep!"
  end

  def poison_attack
    defender.poison if rand(10) < 7
    defender.deduct(2 + rand(3))
    @final_message = "#{ defender.name } got hit!" if !defender.poisoned
    @final_message = "#{ defender.name } got poisoned!" if defender.poisoned
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
    @final_message
  end

  def clean_up
    attacker.cure
  end

  def game_over?
    defender.hp <= 0
  end

  def suffer_poison
    attacker.deduct(1 + rand(4))
  end
  def self.build(name1, name2)
    player1 = Player.new(name1)
    player2 = Player.new(name2)
    new(player1, player2)
  end

end
