class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type
      t.datetime :date
      t.decimal :amount
      t.string :cpf
      t.time :time

      t.timestamps
    end
  end
end
