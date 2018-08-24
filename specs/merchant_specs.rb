require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/merchant.rb'

class TestMerchant < MiniTest::Test
  def setup
    @merchant1 = Merchant.new({ "name" => "Amazon" })
  end

  def test_merchant_has_name
    assert_equal("Amazon", @merchant1.name)
  end

  def test_merchant_all_count
    assert_equal(5, Merchant.all.count)
  end
end
