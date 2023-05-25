class AddShopNameToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :shop_name, :string
  end
end
