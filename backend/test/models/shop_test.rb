require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  def setup
    @shop = shops(:apple_main_shop)
  end  

  test "should be valid" do
    assert @shop.valid?
  end  

  test "name should be present" do
    @shop.name = "     "
    assert_not @shop.valid?
  end

  test "company id should be present" do
    @shop.company_id = nil
    assert_not @shop.valid?
  end
end