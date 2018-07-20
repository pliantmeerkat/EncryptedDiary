require './lib/Security'

RSpec.describe Security do
  let(:encrypt_class) { double :encrypt_class, new: encryption }
  let(:encryption) { double :encryption }
  let(:subject) { described_class.new(encryption) }
  let(:entry) { { '11/11/11' => 'hello' , '22/22/22' => 'goodbye'} }
  context 'Feature 1 - lock' do
    describe '#lock' do
      it { expect(subject).to respond_to(:lock) }
    end
  end
  context 'Feature 2 - Encrypt Diary' do
    describe '#encrypt_diary' do
      before(:each) { allow(encryption).to receive(:encrypt).and_return({}) }
      it { expect(subject).to respond_to(:encrypt_diary).with(1).arguments }
      it { expect(subject.encrypt_diary(entry)).to be_a(Hash) }
      it { expect(subject.encrypt_diary(entry)).to_not eq(entry) }
      it { expect(subject.lock).to eq(false) }
      it 'becomes loacked after encryption' do
        subject.encrypt_diary(entry)
        expect(subject.lock).to eq(true)
      end
    end
  end
  context 'Feature 3 - Decrypt Diary' do
    describe '#decrypt_diary' do
      before(:each) { allow(encryption).to receive(:decrypt) }
      it { expect(subject).to respond_to(:decrypt_diary).with(2).arguments }
      it { expect(subject.decrypt_diary(entry, 100)).to be_a(Hash) }
      it 'becomes locked after encryption' do
        subject.decrypt_diary(entry, 100)
        expect(subject.lock).to eq(false)
      end
    end
  end
end
