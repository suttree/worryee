require 'rubygems'
require 'twilio-ruby'

#if (1 + rand(10) == 5)
if (true)
  account_sid = 'AC2efb3573f29f88e3caf08568b6e1f061'
  auth_token = '58a7025898ed039f92043d73c73d3f06'

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
