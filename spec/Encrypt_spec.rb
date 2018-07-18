require './lib/Encrypt'
describe Encrypt do
  let(:input_text) { ['a', 'abcde', 'jack', 'hello world'] }
  let(:output_text) { ['s', 'stuvw', ';'] }
  context 'Feature_1: Encrypt' do
    describe '#encrypt' do
      it { expect(subject).to respond_to(:encrypt).with(2).arguments }
    end
    describe '#cypher' do
      it { expect(subject).to respond_to(:cypher).with(1).arguments }
      it { expect(subject.cypher(input_text[0])).to eq(output_text[0]) }
      it { expect(subject.cypher(input_text[1])).to eq(output_text[1]) }
    end
    describe '#key' do
      it { expect(subject).to respond_to(:key) } # encryption key
      it { expect(subject.key).to be_an(Integer) } # should be an int
      describe '#gen_key' do
        it { expect(subject).to respond_to(:gen_key) } # generate key
      end
    end
  end
end

