require 'btce'

class BtceGateway
  def initialize
    @ticker ||= Btce::Ticker.new "btc_usd"
  end

  def btce_pull
    BitcoinPrice.create!(
      avg: @ticker.avg,
      buy: @ticker.buy,
      high: @ticker.high,
      last: @ticker.last,
      low: @ticker.low,
      server_time: @ticker.updated,
      vol: @ticker.vol,
      vol_cur: @ticker.vol_cur
    )
  end

  def first_derivative
  end

  def second_derivative
  end

  def five_period_moving_average
    last_five = BitcoinPrice.find(:all, order: "created_at desc", limit: 5)
    moving_average(last_five)
  end

  def ten_period_moving_average
    last_ten = BitcoinPrice.find(:all, order: "created_at desc", limit: 10)
    moving_average(last_ten)
  end

  def moving_average(records)
    prive_array = records.map { |price| price.buy }
    moving_average = prive_array.inject{ |sum, price| sum + price }.to_f / prive_array.size
  end
end
