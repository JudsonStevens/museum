require "minitest"
require "minitest/emoji"
require "minitest/autorun"
require_relative "../lib/patron.rb"

class PatronTest < MiniTest::Test
  def setup
    @p = Patron.new("Bob")
  end

  def test_it_exists
    assert_instance_of Patron, @p
  end

  def test_it_has_interests
    expected = []
    actual = @p.interests
    assert_equal expected, actual
  end

  def test_it_has_a_name
    expected = "Bob"
    actual = @p.name
    assert_equal expected, actual
  end

  def test_it_can_add_interests
    @p.add_interest("Dead Sea Scrolls")
    expected = ["Dead Sea Scrolls"]
    actual = @p.interests
    assert_equal expected, actual
  end

  def test_it_can_add_multiple_interests
    @p.add_interest("Gems and Minerals")
    @p.add_interest("Dead Sea Scrolls")
    expected = ["Gems and Minerals", "Dead Sea Scrolls"]
    actual = @p.interests
    assert_equal expected, actual
  end





end
