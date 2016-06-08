class Game

  attr_reader :player1, :player2, :active_player, :inactive_player, :last_action

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @active_player = player1
    @inactive_player = player2
    @last_action = nil
  end

  def attack
    inactive_player.remove_hitpoints(10)
    switch_turn
  end

  def set_last_action(action)
    @last_action = action
  end


private
  def switch_turn
    active_player == player1 ? @active_player = player2 : @active_player = player1
    active_player == player1 ? @inactive_player = player2 : @inactive_player = player1
  end
end
