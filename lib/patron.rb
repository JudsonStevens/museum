class Patron
  attr_accessor :interests
  attr_reader   :name

  def initialize(name)
    @interests = []
    @name = name
  end

  def add_interest(interest)
    @interests << interest
  end




end
