# encryption class
class Encrypt
  attr_reader :key # temporary attr reader - ideally should not be accessable
  def initialize
    @key = gen_key
  end

  def gen_key
    rand(1000..100_000_0) # generate a random key
  end

  def cypher(text)
    output = ''
    text.each_byte do |c|
      output += c < 113 ? (((c + 3) * 1.5 - (c * 0.36)).to_i).chr : (c - 80).chr
    end
    return output
  end

  def encrypt(text, key)
    key.times do
      text = cypher(text)
    end
    text
  end
end