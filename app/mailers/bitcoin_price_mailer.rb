class BitcoinPriceMailer < ActionMailer::Base
  default from: "buy+sell@richandcjbitcoin.com"

  def send_sell_email(price_id)
    previous = price_id - 1
    @bitcoin_price = BitcoinPrice.find(price_id)
    @previous_record = BitcoinPrice.find(previous)
    mail(
      to: 'cj.reim@me.com',
      cc: 'rich.rines@me.com',
      subject: "Sell Bitcoin - Rich Email"
    )
  end

  def send_buy_email(price_id)
    previous = price_id - 1
    @bitcoin_price = BitcoinPrice.find(price_id)
    @previous_record = BitcoinPrice.find(previous)
    mail(
      to: 'cj.reim@me.com',
      cc: 'rich.rines@me.com',
      subject: "Buy Bitcoin - Rich Email"
    )
  end
end
