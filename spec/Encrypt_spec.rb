require './lib/Encrypt'
require_relative 'test_variables'
describe Encrypt do
  let(:test_vars) { TestVariableHolder.new}
  let(:input_text) { ['a', 'abcde', 'jack', 'hello world'] }
  let(:key) { [1000, 9999, 5500] }
  context 'Feature_1: Encrypt' do
    describe '#encrypt' do
      it { expect(subject).to respond_to(:encrypt).with(2).arguments }
      it 'should encrypt a message' do
        expect(subject.encrypt('hello', 1)).not_to eq('hello') # has changed
      end
    end
    describe '#cypher' do
      it { expect(subject).respond_to?(:cypher, true) }
    end
    describe '#gen_keys' do
      it { expect(subject).respond_to?(:gen_keys, true) } # generate key
      it { expect(subject.send(:gen_keys)).to be_an(Array) } # should return correctly
    end
    describe '#scramble' do
      it { expect(subject).respond_to?(:scramble, true) } # scramble alphabet
      it { expect(subject.send(:scramble)).to be_a(Hash) } # should be a hash
      it { expect(subject.send(:scramble).length).to eq(95) } # should be right length
      describe 'scramble tests' do
        it 'can scramble input letters correctly' do
          expect(subject.send(:scramble, TestVariableHolder::TEST_KEY)).to eq(TestVariableHolder::TEST_HASH)
        end
      end
    end
  end
  context 'Feature_1 :Decrypt' do

  end
  context 'runt - time tests' do

  end
end



