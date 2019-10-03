class Event < ActiveRecord::Base
    has_many :invites 
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

end 