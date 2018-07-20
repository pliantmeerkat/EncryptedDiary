Dir['./lb/*.rb'].each { |file| require file }

# this spec runs full program tests, if all features are implemented correctly
# these to tests will pass and the program is functional

describe 'Program Tests' do
  let(:encrypt) { Encrypt.new }
  let(:security) { Security.new(encrypt) }
  let(:diary) { Diary.new(security) }
  describe 'Test 1: full encrypt - decrypt cycle with one entry' do
    it 'can pass a full cycle' do
      diary.add_entry('hello world')
      diary.encrypt_entries
      key = encrypt.send(:key)
      diary.decrypt_entries(key)
      expect(diary.entries[0].values.join('')).to eq('hello world')
    end
  end
  describe 'Test 2: full cycle with multiple entries' do
    it 'can pass test 2' do
      entries = []
      decrypt_entries = []
      5.times { |_| entries.push((0..8).map { (40 + rand(35)).chr }.join('')) }
      5.times { |i| diary.add_entry(entries[i]) }
      diary.encrypt_entries
      key = encrypt.send(:key)
      diary.decrypt_entries(key)
      diary.entries.each { |i| decrypt_entries << i.values.join('') } 
      expect(decrypt_entries).to eq(entries)
    end
  end
end
