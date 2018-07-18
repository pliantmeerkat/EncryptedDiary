require './lib/Security'

describe Security do
  context 'Feature 1 - lock' do
    describe '#lock' do
      it { expect(subject).to respond_to(:lock) }
      it { expect(subject).to respond_to(:lock_diary) }
    end
  end
  context 'Feature 2 - unlock' do
    describe '#unlock' do
      it { expect(subject).to respond_to(:unlock) }
    end
  end
end
