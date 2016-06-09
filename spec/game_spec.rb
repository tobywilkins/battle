require 'spec_helper'
require 'game'

describe Game do
  subject(:game) { described_class.new(spy1, spy2) }
  let(:game2) { described_class.new(spy3, spy1) }
  let(:game3) { described_class.new(spy4, spy1) }
  let(:lost_game) {described_class.new(spy1, dead_player)}
  let(:spy1) { spy(:spy1, paralyzed: false, asleep: false, poisoned: true, hp: 25) }
  let(:spy2) { spy(:spy2, paralyzed: true, asleep: false, hp: 25) }
  let(:spy3) { spy(:spy3, paralyzed: true, asleep: true, hp: 25) }
  let(:spy4) { spy(:spy4, paralyzed: false, asleep: false, hp: 0) }
  let(:dead_player) { spy(:dead_player, deduct: 1,
                      name: "dead_player",  hp: 0, paralyze: false) }

  describe '#attack' do
    it 'calls deduct on player' do
      game.attack("default_attack")
      expect(spy2).to have_received(:deduct)
  	end

    it 'increments turn by one' do
      expect { game.attack("default_attack") }.to change { game.turn_number }.by(1)
    end

    it 'cannot attack when paralyzed' do
      game.attack("default_attack")
      message = "#[Double :spy2] is paralyzed and couldn't attack!"
      game.attack("default_attack")
      expect(spy1).to have_received(:log).with message
    end

    it 'cannot attack when asleep' do
      message = "#[Double :spy3] is asleep and couldn't attack!"
      game2.attack("default_attack")
      expect(spy1).to have_received(:log).with message
    end

    it 'cannot attack when unconscious' do
      message = "#[Double :spy4] is unconscious and couldn't attack!"
      game3.attack("default_attack")
      expect(spy1).to have_received(:log).with message
    end
  end

  describe '#turn_checker' do
    it 'returns the spy whose turn it is' do
      expect(game.player_turn).to eq spy1
    end
  end

  describe '#game_over' do
    it 'ends the game when a player reaches 0 hp' do
      expect(lost_game.attack("default_attack")).to eq message = "dead_player loses"
    end
  end


end
