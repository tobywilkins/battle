require 'spec_helper'
require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2) }
  let(:player1) { double(:player1, deduct: nil, name: "Player1") }
  let(:player2) { double(:player2, deduct: nil, name: "Player2") }

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



end
