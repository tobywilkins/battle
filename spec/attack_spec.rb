require 'attack'

describe Attack do
  subject(:attack) {described_class.new}
  let(:defender) {spy(:defender, name: "Toby")}
  let(:defender_2) {spy(:defender_2, name: "Toby")}
  let(:attacker) {spy(:attacker, name: "Toby")}

  before do
    allow(Kernel).to receive(:rand) { 1 }
    attack.default_attack(defender)
  end

  describe '#default' do

    it 'sends deduct to defending player' do
      expect(defender).to have_received(:deduct)
    end

    it 'sends paralyze to defending player depending on random' do
      expect(defender).to have_received(:paralyze)
    end

    it 'doesn\'t send paralyze depending on random' do
      allow(Kernel).to receive(:rand) { 8 }
      attack.default_attack(defender_2)
      expect(defender_2).not_to have_received(:paralyze)
    end
  end

  describe '#suffer_poison' do
    it 'returns a number between 1+5' do
      attack.suffer_poison(attacker)
      expect(attacker).to have_received(:deduct).with 2
    end
  end

  describe '#poison_attack' do
    it 'sets the defender to poisoned' do
      attack.poison_attack(defender)
      expect(defender).to have_received(:poison)
    end
  end

  describe '#sleep_attack' do
    it 'sends message to set asleep' do
      attack.sleep_attack(defender)
      expect(defender).to have_received(:set_asleep)
    end
  end

  describe "#heal" do
    it 'calls heal method on attacker' do
      attack.heal(:bleh, attacker)
      expect(attacker).to have_received(:heal)
    end
  end
end
