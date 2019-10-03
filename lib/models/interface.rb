

class Interface
    
    attr_reader :prompt 
    attr_accessor :user 
    
    def initialize
        @prompt = TTY::Prompt.new 
    end 

    def welcome
      puts "Welcome to TBA."
  
      @prompt.select("Are you a current host or a new host?") do |menu| 
        menu.choice "Current Host" , -> { Host.handle_returning_host }
        menu.choice "New Host" , -> { Host.handle_new_host }
      end
    end 

    end 


   def main_menu
       #self.reload
      #system "clear"
       puts "Welcome, #{self.name}!"
       TTY::Prompt.new.select("What would you like to do today?") do |menu|         
        menu.choice "View My Events", -> {display_events(current_user)}
            menu.choice "Create an Event", -> {current_user.create_event}
            menu.choice "Log Out", -> {`open https://calendar.google.com/`}  
        end 

      end 



      #see all guests
# click on a guest and invite them to an event
#give the ability for a guest to see all the events they are going to





