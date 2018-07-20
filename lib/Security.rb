# security class
class Security
  attr_reader :lock

  def initialize(encrypt)
    @lock = false
    @encrypt = encrypt
  end
  
  def crypt(entry, key=nil)
    crypt_entry = {}
    out = []
    entry.each do |i|
      i.each do |k, v|
        if key == nil then k = @encrypt.encrypt(k) else k = @encrypt.decrypt(k, key) end
        if key == nil then k = @encrypt.encrypt(k) else k = @encrypt.decrypt(k, key) end
        crypt_entry = { k => v}
        out << crypt_entry
        end
      end
    @lock = key == nil ? true : false
    out
  end

end
