require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  def setup
    @transaction = transactions(:transaction_one)
  end

  test "should be valid" do
    assert @transaction.valid?
  end

  test "transaction_type should be present" do
    @transaction.transaction_type = nil
    assert_not @transaction.valid?
  end

  test "amount should be present" do
    @transaction.amount = nil
    assert_not @transaction.valid?
  end

  test "card_number should be present" do
    @transaction.card_number = "     "
    assert_not @transaction.valid?
  end

  test "hour should be present" do
    @transaction.hour = nil
    assert_not @transaction.valid?
  end

  test "sign method should return correct sign" do
    assert_equal '+', @transaction.sign
  end
end