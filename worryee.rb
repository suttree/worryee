require 'rubygems'
gem 'imessage'

if (1 + rand(10) == 5)
  imessage send 'What are you worried about?' --to 'duncan@suttree.com'
else
  puts "Nothing to worry about"
end
