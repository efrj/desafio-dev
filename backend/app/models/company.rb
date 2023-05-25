class Company < ApplicationRecord
  has_many :shops
  has_many :transactions
end
