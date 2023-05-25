class AddOwnerToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :owner, :string
  end
end
