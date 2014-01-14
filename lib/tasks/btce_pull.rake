desc 'btce pull'
task btce_pull: :environment do
  e = BtceGateway.new
  e.btce_pull
end
