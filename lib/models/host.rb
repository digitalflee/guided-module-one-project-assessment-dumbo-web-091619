    class Host < ActiveRecord::Base
        has_many :events
        has_many :invites, through: :events

     
         #lines 2 and 3 give us instance methods

         @@prompt = TTY::Prompt.new 

         def self.tty_prompt
             TTY::Prompt.new
         end 


         def self.handle_new_host
           name = self.tty_prompt.ask("What is your name?")
           email = self.tty_prompt.ask("What is your email address?")
           username = self.tty_prompt.ask("What is your username?")
           password = self.tty_prompt.ask("Create a password.")
           new_host = Host.create(name: name, email: email, username: username, password: password) 
           new_host.main_menu
         end 
      
         def self.handle_returning_host
    
           username = self.tty_prompt.ask("Welcome back! What is your username?")
           host = Host.find_by(username: username)
           passwordVar = TTY::Prompt.new.mask("What is your password?")
           current_user = Host.find_by(username: username, password: passwordVar)
           password = gets.chomp
           current_user.main_menu 

          

            #binding.pry
           #main_menu(self)
           # menuchoice = TTY::Prompt.new("Welcome back #{host.name}. What would you like to do?")
        
         end

          def main_menu
            self.reload
            system "clear"
           puts "Welcome, #{self.name}!"
          @@prompt.select("What would you like to do today?") do |menu|
          menu.choice "View My Events", -> {self.display_events}
          menu.choice "Create an Event", -> {self.create_event}
          menu.choice "Change Event date/time", -> {self.change_event_time}
          menu.choice "Remove an Event", -> {self.remove_event}
          menu.choice "Log Out", -> {`open https://calendar.google.com/`}
          end 
          end 

      
        def display_events
           myEvents = self.events.map { |event| {event.name => event}}
           if myEvents.size == 0
             myEvents = ["You don't have any events to display."]
           end
           selected_event = @@prompt.select("pick an event", myEvents)
           puts "#{selected_event.name}"
           puts "#{selected_event.date}"
           puts "#{selected_event.time}"
           puts "#{selected_event.location}"
           @@prompt.select("Main Menu") do |menu|
            menu.choice "back", -> {self.main_menu}
           end 
       end 


       def create_event
                puts "What is the name of your event?"
                name = gets.chomp
        
                puts "What type of event is this?"
                description = gets.chomp 
      
                puts "What is the date of your event?"
                date = gets.chomp
      
                puts "What time is the event?"
                time = gets.chomp
      
                puts "What is the event location?"
                location = gets.chomp
                
                Event.create(name: name, description: description, date: date, time: time, location: location, host: self)

                self.main_menu
          end

          def remove_event

            myEvents = self.events.map { |event| {event.name => event.id}}
           if myEvents.size == 0
             myEvents = ["You don't have any events."]
             self.main_menu 
           end
            puts myEvents 
           event_deletion = @@prompt.select("choose an event to delete", myEvents)
    
           event_to_be_deleted = Event.find(event_deletion)
           event_to_be_deleted.delete
           
    
           self.main_menu
            
          end

          def change_event_time
            #displays list of events
            myEvents = self.events.map { |event| {event.name => event}}
           if myEvents.size == 0
             myEvents = ["You don't have any events to display."]
           end
          event_to_change = @@prompt.select("pick an event to edit", myEvents)
          event_to_change.changetime

           self.main_menu

          end 

          # def changetime
          #   #changes time
          #   puts "make your change"
          #   newtime = gets.chomp 
          #   self.update(time: newtime)
          #   puts "what's the new date"
          #   self.update(date: newdate)
          #   puts "event updated"
          #   sleep 1 
          #   self.main_menu
          # end 


        
         

     end
    #end 
  #end
  

