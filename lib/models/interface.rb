

class Interface
    
    attr_reader :prompt 
    attr_accessor :user 
    
    def initialize
        @prompt = TTY::Prompt.new 
    end 

    def welcome
      puts "Welcome to TBA."
      #binding.pry
      @prompt.select("Are you a guest or a host?") do |menu| 
        menu.choice "Guest", -> {Guest.handle_guest}
        menu.choice "Current Host" , -> { Host.handle_returning_host}
        menu.choice "New Host" , -> { Host.handle_new_host }
      end
    end 

    end 



      


    


      #see all guests
# click on a guest and invite them to an event
#give the ability for a guest to see all the events they are going to





