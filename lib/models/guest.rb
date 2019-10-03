class Guest < ActiveRecord::Base
    has_many :invites
    has_many :events, through: :invites 

    @@prompt = TTY::Prompt.new 

def self.handle_guest 

    email = @@prompt.ask("Welcome back! What is your email address?")
    loggedInGuest = Guest.find_by(email: email)
    
    if loggedInGuest.nil?
     puts "Sorry Try Again"
     sleep 1
     Guest.handle_guest 
    else
    loggedInGuest.guest_menu 
    end 
end

def guest_menu
    self.reload
    system "clear"
    puts "Welcome, #{self.name}!"
    @@prompt.select("Checkout your event invites!") do |menu|
        menu.choice "View My Events", -> {self.guest_invites}
        #menu.choice "Remove an Event", -> {self.remove_event}
        menu.choice "Log Out", -> {`open https://calendar.google.com/`}
    end 
  end 

  def guest_invites
    self.invites.map {|invite| puts invite.event.name}
    # myInvites = Invite.all.select { |invite| {invite.guest_id => self.id} }
    # if myInvites.size == 0
    #   myInvites = ["You don't have any invites."]
    # end
    @@prompt.select("Main Menu") do |menu|
     menu.choice "back", -> {self.guest_menu}
    end 
end 
end 