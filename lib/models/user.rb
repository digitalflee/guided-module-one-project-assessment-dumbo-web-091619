class User < ActiveRecord::Base
    has_many :events
    has_many :invites, through: :events
  #lines 2 and 3 give us instance methods

    @@prompt = TTY::Prompt.new 

    #def self.tty_prompt
       # TTY::Prompt.new
    #end 


    def self.handle_new_host
      name = self.tty_prompt.ask("What is your name?")
      email = self.tty_prompt.ask("What is your email address?")
      username = self.tty_prompt.ask("What is your username?")
      password = self.tty_prompt.ask("Create a password.")
      User.create(name: name, email: email, username: username, password: password) 
    end 
  
    def self.handle_returning_host

       username = self.tty_prompt.ask("Welcome back! What is your username?")
       Host.find_by(username: username)
       passwordVar = TTY::Prompt.new.mask("What is your password?")
       Host.find_by(username: username, password: passwordVar)
       password = gets.chomp 
    
       main_menu(self)
       menuchoice = TTY::Prompt.new("Welcome back #{host.name}. What would you like to do?")
    
     end

      def main_menu
       self.reload
        system "clear"
       puts "Welcome, #{self.name}!"
      @@prompt.select("What would you like to do today?") do |menu|
      menu.choice "View My Events", -> {self.display_events}
      menu.choice "Create an Event", -> {current_user.create_event}
      menu.choice "Log OUt", -> {`open https://calendar.google.com/`}
      end 
      end 

  
    def display_events
      myEvents = self.events.map { |event| {self.name => self.id}}
      if myEvents.size == 0
        myEvents = ["You don't have any teams to display."]
      end
      TTY.select("pick an event", myEvents)
      self.main_menu
  end 
end
    
  
  
#end

