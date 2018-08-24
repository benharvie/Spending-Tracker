require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/tag.rb'

class TagTest < MiniTest::Test
  def setup
    @shopping_tag = Tag.new("Shopping")
  end

  def test_tag_has_category
    assert_equal("Shopping", @shopping_tag.category)
  end
end
