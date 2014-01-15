desc 'btce pull'
task btce_pull: :environment do
  e = BtceGateway.new
  e.btce_pull

  b = BitcoinPrice.last

  if b.first_derivative_five < 0.0
    d = b.id - 1
    c = BitcoinPrice.find(d)
    if c.first_derivative_five >= 0.0
      BitcoinPriceMailer.send_sell_email(b.id).deliver
      b.email_sent = true
      b.email_type = 'sell'
      b.save!
    end
  elsif b.first_derivative_five > 0.0 && b.second_derivative_five > 0.0
    d = b.id - 1
    c = BitcoinPrice.find(d)
    if c.first_derivative_five <= 0.0 && c.second_derivative_five <= 0.0
      BitcoinPriceMailer.send_buy_email(b.id).deliver
      b.email_sent = true
      b.email_type = 'buy'
      b.save!
    end
  end
end
