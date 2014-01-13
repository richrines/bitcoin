class CreateBitcoinPrices < ActiveRecord::Migration
  def change
    create_table :bitcoin_prices do |t|
      t.timestamps null: false

      t.float :avg, null: false
      t.float :buy, null: false
      t.float :high, null: false
      t.float :last, null: false
      t.float :low, null: false
      t.float :vol, null: false
      t.float :vol_cur, null: false
      t.float :five_period
      t.float :first_derivative_five
      t.float :second_derivative_five
      t.float :spread, null: false
      t.float :ten_period
      t.float :first_derivative_ten
      t.float :second_derivative_ten

      t.integer :server_time, null: false
    end
  end
end
