desc 'btce pull_redux'
task btce_pull_redux: :environment do
  e = BtceGateway.new
  e.btce_pull

  b = BitcoinPrice.last

  if b.first_derivative_five < 0.0
    d = b.id - 1
    c = BitcoinPrice.find(d)
    if c.first_derivative_five >= 0.0
      e = BitcoinPrice.find(b.id)
      BitcoinPriceMailer.send_sell_email(b.id).deliver
      e.email_sent = true
      e.email_type = 'sell'
      e.save!
    end
  elsif b.first_derivative_five > 0.0 && b.second_derivative_five > 0.0
    d = b.id - 1
    c = BitcoinPrice.find(d)
    if c.first_derivative_five <= 0.0 && c.second_derivative_five <= 0.0
      e = BitcoinPrice.find(b.id)
      BitcoinPriceMailer.send_buy_email(b.id).deliver
      e.email_sent = true
      e.email_type = 'buy'
      e.save!
    end
  end
end
