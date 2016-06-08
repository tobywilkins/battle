require 'spec_helper'
require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2) }
  let(:player1) { double(:player1, deduct: nil, name: "Player1", hp: 10) }
  let(:player2) { double(:player2, deduct: nil, name: "Player2", hp:10) }
  let(:dead_player) { double(:dead_player, deduct: nil, name: "dead_player",  hp: 0) }

  describe '#attack' do
    it 'calls deduct on player' do
      expect(player2).to receive(:deduct)
      game.attack
  	end

    it 'increments turn by one' do
      expect { game.attack }.to change { game.turn_number }.by(1)
    end

  end

  describe '#turn_checker' do
    it 'returns the player whose turn it is' do
      expect(game.player_turn).to eq player1
    end
  end

  describe '#game_over' do
    it 'ends the game when a player reaches 0 hp' do
      lost_game = Game.new(player1, dead_player)
      expect(lost_game.attack).to eq "dead_player loses"
    end
  end

end
