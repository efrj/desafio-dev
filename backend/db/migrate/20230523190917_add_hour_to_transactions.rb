class AddHourToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :hour, :integer
  end
end
