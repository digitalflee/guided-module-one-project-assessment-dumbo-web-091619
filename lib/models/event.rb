require 'pry'
class Event < ActiveRecord::Base
    
    @@prompt = TTY::Prompt.new  
    has_many :invites 
    has_many :guests, through: :invites 
    belongs_to :host

    def changetime
        #changes time & date
        #can only call event instances within Event class
        puts "make your change"
        newtime = gets.chomp 
        self.update(time: newtime)
        puts "what's the new date"
        newdate = gets.chomp 
        self.update(date: newdate)
        puts "event updated"
        sleep 1 
        self.host.main_menu
      end 

    def self.list_guests
     Guest.all.map {|guest| {guest.name => guest}}
    end 

    def invite_guests
        guest_selection = @@prompt.select("choose a guest to invite", Event.list_guests)
        Invite.create(guest: guest_selection, event: self)
        self.host.main_menu 
    end 

    def guest_list
        self.guests.map {|guest| puts guest.name}
        @@prompt.select("") do |menu|
            menu.choice "back", -> {self.host.main_menu}       
        end 
    end 


end 
0