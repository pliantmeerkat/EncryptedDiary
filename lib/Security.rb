# security class
class Security
  attr_reader :lock

  def initialize(encrypt)
    @lock = false
    @encrypt = encrypt
  end

  def encrypt_diary(entry)
    crypt_entry = {}
    entry.each do |k, v|
      k = @encrypt.encrypt(k)
      v = @encrypt.encrypt(v)
      crypt_entry[k] = v
    end
    @lock = true
    crypt_entry
  end

  def decrypt_diary(entry, key)
    crypt_entry = {}
    entry.each do |k, v|
      k = @encrypt.decrypt(k, key)
      v = @encrypt.decrypt(v, key)
      crypt_entry[k] = v
    end
    @lock = false
    crypt_entry
  end
end
