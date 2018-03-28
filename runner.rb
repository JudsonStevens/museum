require_relative 'lib/museum.rb'
require_relative 'lib/patron.rb'

class Runner

  def initialize
  end

  def interface_with_user
    puts "What would you like to name the museum?"
    print "> "
    @user_input = gets.chomp.strip
    @museum = Museum.new(@user_input)
    print_instructions
    until @user_input == "q"
      @user_input = gets.chomp.strip
      case
      when @user_input == "e" then request_name_and_cost
      when @user_input == "a" then request_patron_name
      when @user_input == "r" then get_revenue
      when @user_input == "u" then get_exhibit_name_for_removal
      when @user_input == "q" then exit
      end
    end
  end 

  def print_instructions
    print "Press (e) to add an exhibit, (a) to add a patron,"
    print "(r) to see the total revenue, (t) to see the top "
    print "exhibits, (u) to remove unpopular exhibits, and "
    puts "press (q) at any time to quit."
  end

  def request_name_and_cost
    puts "Give me a name for the exhibit."
    name = gets.chomp.strip
    puts "Give me a price to charge to see the exhibit."
    cost = gets.chomp.strip
    @museum.add_exhibit(name, cost)
  end
end

x = Runner.new
x.interface_with_user