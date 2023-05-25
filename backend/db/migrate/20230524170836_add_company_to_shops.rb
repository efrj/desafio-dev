class AddCompanyToShops < ActiveRecord::Migration[7.0]
  def change
    add_reference :shops, :company, null: false, foreign_key: true
  end
end
