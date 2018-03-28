require "minitest"
require "minitest/emoji"
require "minitest/autorun"
require_relative "../lib/patron.rb"

class PatronTest < MiniTest::Test
  def setup
    @p = Patron.new
  end

  def test_it_exists
    assert_instance_of Patron, @p
  end

  def test_it_has_interests
    expected = []
    actual = @p.interests
    assert_equal expected, actual
  end






end
