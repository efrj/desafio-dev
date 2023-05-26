require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  test "should get index" do
    Transaction.delete_all
    Shop.delete_all
    Company.delete_all

    expected_response = []

    9.times do |n|
      company = Company.create(name: "Company #{n+1}")
      shop = Shop.create(name: "Shop #{n+1}", company: company)
      balance = (n + 1) * 100

      transaction = Transaction.new(
        company: company,
        shop: shop,
        transaction_type: "credit",
        card_number: "123456789",
        hour: Time.now,
        amount: balance
      )
      transaction.save!

      expected_response << {
        "company_id" => company.id,
        "shop_id" => shop.id,
        "company_name" => company.name,
        "shop_name" => shop.name,
        "balance" => balance.to_f
      }
    end

    get :index
    assert_response :success

    parsed_response = JSON.parse(response.body)
    assert_equal expected_response.length, parsed_response.length

    expected_response.each_with_index do |expected_item, index|
      actual_item = parsed_response[index]

      assert_equal expected_item["company_id"], actual_item["company_id"]
      assert_equal expected_item["shop_id"], actual_item["shop_id"]
      assert_equal expected_item["company_name"], actual_item["company_name"]
      assert_equal expected_item["shop_name"], actual_item["shop_name"]
      assert_equal expected_item["balance"].to_f, actual_item["balance"].to_f
    end
  end
end
