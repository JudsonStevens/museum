require_relative '../lib/patron.rb'

class Museum
  attr_reader :name,
              :revenue
  attr_accessor :exhibits


  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
  end

  def add_exhibit(exhibit, cost)
    @exhibits[exhibit] = cost
  end

  def admit(patron)
    @revenue += 10
    patron.interests.each do |interest|
      if @exhibits.keys.include?(interest)
        @revenue += @exhibits[interest]
      end
    end
  end


end
