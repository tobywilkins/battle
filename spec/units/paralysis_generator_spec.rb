require 'paralysis_generator'

describe ParalysisGenerator do

  subject(:paralysis_generator) {described_class.new(player)}
  let(:player) {spy(:player)}

  describe '#process_paralysis' do
    it 'skips a turn' do
      paralysis_generator.process_paralysis
      expect(player).to have_received(:paralyze)
    end
  end
end