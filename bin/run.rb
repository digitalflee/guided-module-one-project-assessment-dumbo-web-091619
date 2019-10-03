require_relative '../config/environment'

require 'pry'

interface = Interface.new 
loggedInUser = interface.welcome #the purpose of answer shows the answer

while loggedInUser.nil?
    loggedInUser = interface.welcome
end 

#interface.user = loggedInUser
#interface.user.main_menu 


binding.pry 
0
puts "hello world"
