describe Player do
  subject(:player) { described_class.new("Toby") }

  before(:each) do
    player.poison
    player.paralyze
    player.set_asleep
  end

  describe '#poison' do
    it 'sets player to poisoned' do
      expect(player.poisoned).to eq true
    end
  end

  describe '#paralyze' do
    it 'sets player to paralyzed' do
      expect(player.paralyzed).to eq true
    end
  end

  describe '#set_asleep' do
    it 'sets player to asleep' do
      expect(player.asleep).to eq true
    end
  end

  describe '#cure' do
    it 'cures player of paralysis and sleep' do
      player.cure
      expect(player.asleep).to eq false
      expect(player.paralyzed).to eq false
    end
  end

  describe '#deduct' do
    it 'reduces hp by given amount' do
      expect { player.deduct(5) }.to change { player.hp }.by(-5)
    end
  end

  describe '#log' do
    it 'records last action' do
      player.log("Hello")
      expect(player.last_action).to eq "Hello"
    end
  end

  describe '#deduct' do
    it 'reduces hp by given amount' do
      srand(5)
      expect { player.heal }.to change { player.hp }.by(10)
    end
  end

end
