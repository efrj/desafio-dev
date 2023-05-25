class RemoveFieldsFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :upload
    remove_column :transactions, :owner
    remove_column :transactions, :shop_name
    add_reference :transactions, :company, foreign_key: true
    add_reference :transactions, :shop, foreign_key: true
  end  
end
