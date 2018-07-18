# diary class
class Security
  attr_reader :lock

  def initialize(encrypt = Encrypt.new)
    @lock = false
    @encrypt = encrypt
  end

  def lock_diary
    @lock = true
  end

  def unlock
    @lock = false
  end
end
