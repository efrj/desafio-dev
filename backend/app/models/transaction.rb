class Transaction < ApplicationRecord
  belongs_to :company
  belongs_to :shop

  validates :amount, presence: true
  validates :transaction_type, presence: true
  validates :card_number, presence: true
  validates :hour, presence: true

  enum transaction_type: {
    debit: 1,
    boleto: 2,
    financing: 3,
    credit: 4,
    loan_receipt: 5,
    sales: 6,
    ted_receipt: 7,
    doc_receipt: 8,
    rent: 9
  }

  def sign
    case transaction_type.to_sym
    when :debit, :credit, :loan_receipt, :sales, :ted_receipt, :doc_receipt
      '+'
    when :boleto, :financing, :rent
      '-'
    else
      raise "Unknown transaction type: #{transaction_type}"
    end
  end

  TRANSACTION_TYPE_MAP = transaction_types.invert
end
