require './lib/Diary'

describe Diary do
  let(:security_class) { double :security_class, new: security }
  let(:security) { double :security }
  let(:subject) { described_class.new(security) }
  context 'Feature - 1 add_entry' do
    before(:each) { allow(security).to receive(:lock).and_return(false) }
    describe '#add_entry' do
      it { expect(subject).to respond_to(:add_entry).with(1).arguments }
      it { expect(subject).to respond_to(:entries) }
      # it { expect(subject.add_entry('hello')).to eq(subject.entries.last.values.inject) }
    end
    describe 'throws error  on lock' do
      it 'should raise an error if locked' do
        allow(security).to receive(:lock).and_return(true)
        expect { subject.add_entry('0') }.to raise_error('Diary is encrypted, decrypt to add an enry')
      end
    end
  end
  context 'Feature - 2 get_entries' do
    before(:each) { allow(security).to receive(:lock).and_return(false) }
    describe '#get_entries' do
      it { expect(subject).to respond_to(:see_entries) }
      it { expect(subject.see_entries).to be_an(Array) }
    end
  end
  context 'Feature - 3 Encrypt entries' do
    before(:each) { allow(security).to receive(:lock).and_return(false) }
    before(:each) { allow(security).to receive(:crypt).and_return([{'11' => 'hello'}]) }
    describe '#encrypt_entries' do
      it { expect(subject).to respond_to(:encrypt_entries) }
      it 'cannot encrypt non-decrypted data' do
        allow(security).to receive(:lock).and_return(true)
        expect { subject.encrypt_entries }.to raise_error('must decrypt before encrytping')
      end
      it 'can encrypt decrypted data' do
        expect(security).to receive(:crypt).with([{}])
        subject.encrypt_entries
      end
      it { expect(subject.encrypt_entries).to be_an(Array) }
    end
  end
  context 'Feature - 4 Decrypt entries' do
    before(:each) { allow(security).to receive(:lock).and_return(true) }
    before(:each) { allow(security).to receive(:crypt).and_return([{'11' => 'hello'}]) }
    describe '#decrypt_entries' do
      it { expect(subject).to respond_to(:decrypt_entries).with(1).arguments }
      it { expect(subject.decrypt_entries(100)).to be_an(Array) }
      it 'cannot decrypt non encrypted data' do
        allow(security).to receive(:lock).and_return(false)
        expect { subject.decrypt_entries(100) }.to raise_error('must encrypt before decrytping')
      end
    end
  end
end
