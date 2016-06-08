require 'game'

describe Game do

  subject(:game) {described_class.new(player1,player2)}
  let(:player2) { spy(:player, hitpoints: 100) }
  let(:player1) { spy(:player, hitpoints: 100) }

    describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player1).to eq player1
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.player2).to eq player2
    end
  end

  describe "#set_last_action" do
    it "sets last action to attack if attack was done last" do
      game.set_last_action("Attack")
      expect(game.last_action).to eq ("Attack")
    end
  end
end
