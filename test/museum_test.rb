require "minitest"
require "minitest/emoji"
require "minitest/autorun"
require_relative "../lib/museum.rb"

class MuseumTest < MiniTest::Test

  def setup
    @m = Museum.new("Denver Museum of Nature and Science")
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


end
