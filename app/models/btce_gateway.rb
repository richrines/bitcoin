require 'btce'

class BtceGateway
  def initialize
    @ticker ||= Btce::Ticker.new "btc_usd"
  end

  def btce_pull
    bitcoin_price = BitcoinPrice.create!(
      avg: @ticker.avg,
      buy: @ticker.buy,
      high: @ticker.high,
      last: @ticker.last,
      low: @ticker.low,
      server_time: @ticker.updated,
      spread: spread,
      vol: @ticker.vol,
      vol_cur: @ticker.vol_cur
    )

    bitcoin_price.five_period = five_period_moving_average
    bitcoin_price.ten_period = ten_period_moving_average
    bitcoin_price.save!

    bitcoin_price.first_derivative_five = first_derivative_five_period
    bitcoin_price.first_derivative_ten = first_derivative_ten_period
    bitcoin_price.save!

    bitcoin_price.second_derivative_five = second_derivative_five_period
    bitcoin_price.second_derivative_ten = second_derivative_ten_period
    bitcoin_price.save!
  end

  private

  def first_derivative
  end

  def second_derivative
  end

  def spread
    @ticker.buy - @ticker.sell
  end

  def first_derivative_five_period
    current_record = BitcoinPrice.order("created_at desc").limit(2).first
    previous_record = BitcoinPrice.order("created_at desc").limit(2).last

    current_record.five_period - previous_record.five_period
  end

  def first_derivative_ten_period
    current_record = BitcoinPrice.order("created_at desc").limit(2).first
    previous_record = BitcoinPrice.order("created_at desc").limit(2).last
    current_record.ten_period - previous_record.ten_period
  end

  def second_derivative_five_period
    current_record = BitcoinPrice.order("created_at desc").limit(2).first
    previous_record = BitcoinPrice.order("created_at desc").limit(2).last
    current_record.first_derivative_five - previous_record.first_derivative_five
  end

  def second_derivative_ten_period
    current_record = BitcoinPrice.order("created_at desc").limit(2).first
    previous_record = BitcoinPrice.order("created_at desc").limit(2).last
    current_record.first_derivative_ten - previous_record.first_derivative_ten
  end

  def five_period_moving_average
    last_five = BitcoinPrice.order("created_at desc").limit(5)
    moving_average(last_five)
  end

  def ten_period_moving_average
    last_ten = BitcoinPrice.order("created_at desc").limit(10)
    moving_average(last_ten)
  end

  def moving_average(records)
    price_array = records.map { |price| price.buy }
    moving_average = price_array.inject{ |sum, price| sum + price }.to_f / price_array.size
  end
end
