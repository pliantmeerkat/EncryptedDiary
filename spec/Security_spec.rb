require './lib/Diary'

describe Diary do
  context 'Feature - 1 add_entry' do
    describe '#add_entry' do
      before(:each) { subject.security.unlock }
      it { expect(subject).to respond_to(:add_entry).with(1).arguments }
      it { expect(subject).to respond_to(:entries) }
      it { expect(subject.add_entry('hello')).to eq(subject.entries.values.inject) }
    end
    describe 'throws error  on lock' do
      before(:each) { subject.security.lock_diary }
      it 'should raise an error if locked' do
        expect { subject.add_entry('0') }.to raise_error('Diary is locked!')
      end
    end
  end
  context 'Feature - 2 get_entries' do
    describe '#get_entries' do
      before(:each) { subject.security.unlock }
      it { expect(subject).to respond_to(:see_entries) }
    end
  end
end
