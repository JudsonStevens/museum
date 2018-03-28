require_relative '../lib/patron.rb'

class Museum
  attr_reader :name,
              :revenue
  attr_accessor :exhibits,
                :names_of_patrons_at_exhibit,
                :exhibit_attendee_count


  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
    @names_of_patrons_at_exhibit = []
    @exhibit_attendee_count = {}
  end

  def add_exhibit(exhibit, cost)
    @exhibits[exhibit] = cost
  end

  def admit(patron)
    @revenue += 10
    patron.interests.each do |interest|
      if @exhibits.keys.include?(interest)
        @revenue += @exhibits[interest]
        @names_of_patrons_at_exhibit << [patron.name, interest]
        increase_attendee_count(interest)
      end
    end
  end

  def patrons_of(exhibit)
    list_of_names = []
    @names_of_patrons_at_exhibit.find_all do |array|
      if array[1] == exhibit
        list_of_names << array[0]
      end
    end
    return list_of_names
  end

  def exhibits_by_attendees
    sorted_array = @exhibit_attendee_count.to_a.sort_by { |count| count[0] }
    final_sorted_array = sorted_array.map { |name| name[0] }
    return final_sorted_array
  end

  def increase_attendee_count(exhibit)
    if !@exhibit_attendee_count.keys.include?(exhibit)
      @exhibit_attendee_count[exhibit] = 1
    elsif @exhibit_attendee_count.keys.include?(exhibit)
      @exhibit_attendee_count[exhibit] += 1
    end
  end

  def remove_unpopular_exhibits(threshold)
    @exhibit_attendee_count.each_key do |name|
      if @exhibit_attendee_count[name] < threshold
        @exhibits.delete(name)
      end
    end
  end


end
