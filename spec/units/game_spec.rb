require 'game'

describe Game do
  subject(:game) {described_class.new}
  let(:player2) { spy(:player, hitpoints: 100) }

  describe "#attack" do
    it "should ask player to remove hitpoints if attacked" do
      game.attack(player2)
      expect(player2).to have_received(:remove_hitpoints)
    end
  end
end
