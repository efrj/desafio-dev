class TransactionsController < ApplicationController
  def index
    shops = Shop.includes(:transactions, :company).all
    shops_with_balance = shops.map do |shop|
      transactions = shop.transactions
      balance = transactions.sum { |transaction| transaction.sign == '+' ? transaction.amount : -transaction.amount }
      {
        company_id: shop.company.id,
        shop_id: shop.id,
        company_name: shop.company.name,
        shop_name: shop.name,
        balance: balance
      }
    end
    render json: shops_with_balance
  end
end
