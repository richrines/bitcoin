web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: bundle exec rake jobs:work
worker: bundle exec rake btce_pull
