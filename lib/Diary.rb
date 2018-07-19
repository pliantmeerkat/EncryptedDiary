require 'date'
# Diary text class
class Diary

  attr_accessor :entries
  attr_reader :security
  def initialize(security=Security.new)
    @entries = {}
    @security = security
    @time = Time.new
  end

  def add_entry(text)
    return raise 'Diary is locked!' if @security.lock == true
    @entries[@time] = text
  end

  def see_entries
    return raise 'Diary is locked!' if @security.lock == true
    @entries.join("\n")
  end
end
