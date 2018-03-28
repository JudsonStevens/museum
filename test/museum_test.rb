require "minitest"
require "minitest/emoji"
require "minitest/autorun"
require_relative "../lib/museum.rb"
require_relative "../lib/patron.rb"

class MuseumTest < MiniTest::Test

  def setup
    @m = Museum.new("Denver Museum of Nature and Science")
    @bob = Patron.new("Bob")
    @sally = Patron.new("Sally")
  end

  def test_it_exists
    assert_instance_of Museum, @m
  end

  def test_it_has_a_name
    expected = "Denver Museum of Nature and Science"
    actual = @m.name
    assert_equal expected, actual
  end

  def test_it_starts_with_no_exhibits
    expected = {}
    actual = @m.exhibits
    assert_equal expected, actual
  end

  def test_it_can_add_exhibit_with_cost
    @m.add_exhibit("Dead Sea Scrolls", 10)
    expected = {"Dead Sea Scrolls" => 10}
    actual = @m.exhibits
    assert_equal expected, actual
  end

  def test_it_can_give_correct_revenue
    @m.add_exhibit("Dead Sea Scrolls", 10)
    @m.add_exhibit("Gems and Minerals", 0)
    @bob.add_interest("Gems and Minerals")
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Imax")
    @sally.add_interest("Dead Sea Scrolls")
    @m.admit(@bob)
    @m.admit(@sally)
    expected = 40
    actual = @m.revenue
    assert_equal expected, actual
  end

  def test_it_can_return_names_of_patron_at_exhibit
    @m.add_exhibit("Dead Sea Scrolls", 10)
    @m.add_exhibit("Gems and Minerals", 0)
    @bob.add_interest("Gems and Minerals")
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Imax")
    @sally.add_interest("Dead Sea Scrolls")
    @m.admit(@bob)
    @m.admit(@sally)
    expected = ["Bob", "Sally"]
    actual = @m.patrons_of("Dead Sea Scrolls")
    assert_equal expected, actual
  end

  def test_it_can_return_sorted_exhibits_by_attendees
    @m.add_exhibit("Dead Sea Scrolls", 10)
    @m.add_exhibit("Gems and Minerals", 0)
    @bob.add_interest("Gems and Minerals")
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Imax")
    @sally.add_interest("Dead Sea Scrolls")
    @m.admit(@bob)
    @m.admit(@sally)
    expected = ["Dead Sea Scrolls", "Gems and Minerals"]
    actual = @m.exhibits_by_attendees
    assert_equal expected, actual
  end

end
