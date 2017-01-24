require File.expand_path('../config/environment', __FILE__)

if ENV['RACK_ENV'] == 'development'
  puts 'Starting server ...'
end

run Barebones::App.instance