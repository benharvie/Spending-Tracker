require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/merchant.rb'

class TestMerchant < MiniTest::Test
  def setup
    @merchant1 = Merchant.new("Amazon")
  end

  def test_merchant_has_name
    assert_equal("Amazon", @merchant1.name)
  end
end
