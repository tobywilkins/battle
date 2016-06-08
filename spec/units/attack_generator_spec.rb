require 'attack_generator'

describe AttackGenerator do

  subject(:attack_generator) {described_class.new(player)}
  let(:player) {spy(:player)}

 describe '#process_attack' do
    it 'deals some damage' do
      attack_generator.process_attack
      expect(player).to have_received(:remove_hitpoints)
    end
  end
end