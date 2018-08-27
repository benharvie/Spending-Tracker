require 'minitest/autorun'
require 'minitest/rg'
require_relative '../tag.rb'

class TagTest < MiniTest::Test
  def setup
    @shopping_tag = Tag.new({ "category" => "Shopping" })
  end

  def test_tag_has_category
    assert_equal("Shopping", @shopping_tag.category)
  end
end
