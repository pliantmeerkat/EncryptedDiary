# encryption class
class Encrypt
  attr_reader :key # temporary attr reader - ideally should not be accessable

  def initialize
    @letters = {}
    gen_keys
  end

  private

  def gen_keys
    @key = rand(100..500) # generate a random key
    @keys = (32..126).to_a.shuffle # all numbers relevent shuffled
  end

  def scramble(keys = @keys)
    count = 0
    (32..126).each do |i|
      @letters[i] = keys[count].chr
      count += 1
    end
    @letters # for rspec
  end

  def cypher(text)
    text.split('').map { |c| scramble.key(c).chr }.join('')
  end

  public

  def encrypt(text, key)
    key.times do
      text = cypher(text)
    end
  end

end
