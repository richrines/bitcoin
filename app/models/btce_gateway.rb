require 'btce'

class BtceGateway
  def btce_pull
    instantiate_ticker

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

  private

  def instantiate_ticker
    @ticker ||= Btce::Ticker.new "btc_usd"
  end

  def first_derivative
  end

  def second_derivative
  end

  def five_period_moving_average
    last_five = BitcoinPrice.find(:all, order: "created_at desc", limit: 5)
  end

  def ten_period_moving_average
    last_ten = BitcoinPrice.find(:all, order: "created_at desc", limit: 10)
  end
end
