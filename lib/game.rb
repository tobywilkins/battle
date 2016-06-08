class Game

  attr_reader :player1, :player2

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @active_player = player1
  end

  def active
    active_player.name
  end

  def attack
    inactive_player.remove_hitpoints(10)
    switch_turn
  end


private

attr_reader :active_player, :inactive_player

  def switch_turn
    active_player == player1 ? @active_player = player2 : @active_player = player1
  end

  def inactive_player
    active_player == player1 ? @inactive_player = player2 : @inactive_player = player1
  end


end
