require "player"

describe Player do
  subject(:player) { described_class.new("Van") }

  describe "#new" do
    it { should respond_to(:hitpoints) }
  end

  describe "#remove_hitpoints" do
    it "should remove the hitpoints" do
      player.remove_hitpoints(10)
      expect(player.hitpoints).to eq(Player::DEFAULT_HITPOINTS - 10)
    end
  end
end
