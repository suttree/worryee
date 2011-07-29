require 'rubygems'
require 'twitter'
require 'open-uri'

require File.join(File.dirname(__FILE__), 'helpers', 'config_store')
config = ConfigStore.new(File.join(File.dirname(__FILE__), '.twitter'))
oauth = Twitter::OAuth.new(config['token'], config['secret'])

if config['atoken'] && config['asecret']
  oauth.authorize_from_access(config['atoken'], config['asecret'])
  twitter = Twitter::Base.new(oauth)
  
elsif config['rtoken'] && config['rsecret']  
  oauth.authorize_from_request(config['rtoken'], config['rsecret'], config['pin'])
  twitter = Twitter::Base.new(oauth)
  
  config.update({
    'atoken'  => oauth.access_token.token,
    'asecret' => oauth.access_token.secret,
  }).delete('rtoken', 'rsecret')
else
  config.update({
      'rtoken'  => oauth.request_token.token,
      'rsecret' => oauth.request_token.secret,
    })

  puts <<EOS
Visit #{oauth.request_token.authorize_url} in your browser to authorize the app,
then enter the PIN you are given:
EOS

  pin = STDIN.readline.chomp
  config.update({ 'pin' => pin })
  exit('Run this script again, now that you are authorised')
end

if (1 + rand(6) == 6)
  twitter.direct_message_create('suttree', "What are you worried about?")
else
  puts "Nothing to worry about"
end
