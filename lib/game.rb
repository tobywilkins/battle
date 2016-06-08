class Game

attr_reader :player1, :player2, :active_player, :inactive_player, :last_action

def self.create(player_1, player_2)
  @game = Game.new(player_1, player_2)
end

def self.instance
  @game
end

def initialize(player1,player2)
  @player1 = player1
  @player2 = player2
  @active_player = player1
  @inactive_player = player2
  @last_action = nil
end

def switch_turn
  switch_active_player
end

def set_last_action(action)
  @last_action = action
end

private
  def switch_active_player
    active_player == player1 ? @active_player = player2 : @active_player = player1
    active_player == player1 ? @inactive_player = player2 : @inactive_player = player1
  end
end
