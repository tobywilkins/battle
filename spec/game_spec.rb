require 'spec_helper'
require 'game'

describe Game do
  subject(:game) { described_class.new(player, player) }
  let(:player) { double(:player, deduct: nil, name: "Player") }

  describe '#attack' do
    it 'calls deduct on player' do
      expect(player).to receive(:deduct)
      game.attack(player)
  	end
  end

end
