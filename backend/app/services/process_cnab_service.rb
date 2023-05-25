class ProcessCnabService
  def self.call(upload)
    upload.file.blob.open do |file|
      file.each do |line|
        transaction_type = Transaction::TRANSACTION_TYPE_MAP[line[0..0].to_i]
        date = line[1..8]
        amount = line[9..18]
        cpf = line[19..29]
        card_number = line[30..41]
        hour = line[42..47]
        company_name = line[48..61].strip
        shop_name = line[62..81].strip

        company = Company.find_or_create_by!(name: company_name)
        shop = Shop.find_or_create_by!(name: shop_name, company: company)

        Transaction.create!(
          transaction_type: transaction_type,
          date: Date.strptime(date, '%Y%m%d'),
          amount: amount.to_f / 100,
          cpf: cpf,
          card_number: card_number,
          hour: hour,
          company: company,
          shop: shop
        )
      end
    end
  rescue => e
    Rails.logger.error "Failed to process upload ##{upload.id}: #{e.message}"
  end
end
