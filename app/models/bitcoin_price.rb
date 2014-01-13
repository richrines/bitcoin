class BitcoinPrice < ActiveRecord::Base
  validates :avg, presence: true
  validates :buy, presence: true
  validates :high, presence: true
  validates :last, presence: true
  validates :low, presence: true
  validates :server_time, presence: true
  validates :vol, presence: true
  validates :vol_cur, presence: true
end
