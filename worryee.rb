require 'rubygems'
gem 'twitter'
require 'twitter'
require 'open-uri'
require 'securerandom'

require File.join(File.dirname(__FILE__), 'helpers', 'config_store')
settings = ConfigStore.new(File.join(File.dirname(__FILE__), '.twitter'))
#oauth = Twitter::OAuth.new(config['token'], config['secret'])

Twitter.configure do |config|
  config.consumer_key = settings['ckey']
  config.consumer_secret = settings['csecret']
  config.oauth_token = settings['atoken']
  config.oauth_token_secret = settings['asecret']
end

if (1 + rand(10) == 5)
  Twitter.direct_message_create('troisenne', "What are you worried about? - #{SecureRandom.hex[0..4]}")
else
  puts "Nothing to worry about"
end
