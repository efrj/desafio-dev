class Shop < ApplicationRecord
  belongs_to :company
  has_many :transactions

  validates :name, presence: true
  validates :company_id, presence: true
end
