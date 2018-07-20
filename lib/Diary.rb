require 'date'
# Diary text class
class Diary

  attr_accessor :entries
  attr_reader :security
  def initialize(security)
    @entries = {}
    @security = security
    @time = Time.new
  end

  def add_entry(text)
    return raise 'Diary is encrypted, decrypt to add an enry' if @security.lock == true
    @entries[@time] = text
  end

  def see_entries
    return raise 'Diary is encrypted, decrypt to add an entry' if @security.lock == true
    @entries
  end

  def encrypt_entries
    return raise('must decrypt before encrytping') if @security.lock == true
    @entries = security.encrypt_diary(@entries)
  end

  def decrypt_entries(key)
    return raise('must encrypt before decrytping') if @security.lock == false
    @entries = security.decrypt_diary(@entries, key)
  end
end
