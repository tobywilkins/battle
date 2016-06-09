require 'attack'

describe Attack do
  subject(:attack) {described_class.new}
  let(:defender) {spy(:defender, name: "Toby")}
  let(:defender_2) {spy(:defender_2, name: "Toby")}
  let(:attacker) {spy(:attacker, name: "Toby")}

  describe '#default' do

    before do
      attack.default_attack(defender)
      srand(1)
    end

    it 'sends deduct to defending player' do
      expect(defender).to have_received(:deduct)
    end

    it 'sends paralyze to defending player depending on random' do
      expect(defender).to have_received(:paralyze)
    end

    it 'doesn\'t send paralyze depending on random' do
      srand(8)
      attack.default_attack(defender_2)
      expect(defender_2).not_to have_received(:paralyze)
    end
  end

  describe '#suffer_poison' do
    it 'returns a number between 1+5' do
      srand(2)
      attack.suffer_poison(attacker)
      expect(attacker).to have_received(:deduct).with 3
    end
  end

  describe '#poison_attack' do
    it 'sets the defender to poisoned' do
      srand(4)
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
end