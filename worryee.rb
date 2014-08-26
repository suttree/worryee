require 'rubygems'
require 'twilio-ruby'

if (1 + rand(10) == 5)
  account_sid = ''
  auth_token = ''

  client = Twilio::REST::Client.new account_sid, auth_token

  client.account.messages.create(
    :from => '+44 1908 410338',
    :to => '+447740302248',
    :body => 'What are you worried about?'
  ) 
  puts 'Sent worryee'
else
  puts 'Nothing to worryee about'
end
