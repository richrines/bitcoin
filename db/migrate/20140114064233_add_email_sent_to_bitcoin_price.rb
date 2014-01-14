class AddEmailSentToBitcoinPrice < ActiveRecord::Migration
  def change
    add_column :bitcoin_prices, :email_sent, :boolean, default: false, null: false
    add_column :bitcoin_prices, :email_type, :string
  end
end
