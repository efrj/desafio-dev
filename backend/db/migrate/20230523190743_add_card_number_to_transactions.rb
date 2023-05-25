class AddCardNumberToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :card_number, :string
  end
end
