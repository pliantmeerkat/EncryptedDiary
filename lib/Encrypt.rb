# encryption class
class Encrypt
  
  def initialize
    @letters = {}
    gen_keys
  end

  private

  attr_reader :key # temporary attr readers - ideally should not be accessable
  attr_reader :char_key 


  def gen_keys
    @key = rand(100..500) # generate a random key
    @char_key = (32..126).to_a.shuffle # all numbers relevent shuffled
  end

  def scramble(keys = @char_key)
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

  ## decrypt methods

  def rev_cypher(text)
    return '' if text == nil
    text.split('').map { |c| @letters[c.codepoints.to_a.join('').to_i] }.join('')
  end

  public

  def encrypt(text)
    @key.times do
      text = cypher(text)
    end
    puts "Your key is#{@key}"
    text
  end

  def decrypt(text, key)
    key.times do
      text = rev_cypher(text)
    end
    text
  end
end
