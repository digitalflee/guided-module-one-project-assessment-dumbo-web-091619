Host.destroy_all
Event.destroy_all
Guest.destroy_all 
Invite.destroy_all


# h1 = Host.first
# h2 = Host.second
# h3 = Host.third
# h4 = Host.fourth
# h5 = Host.fifth

host1 = Host.create(name: "Will", email: "will@mail.com", username: "yourown", password: "passh1")
host2 = Host.create(name: "Pam", email: "pam@mail.com", username: "pamrocks", password: "passh2")
host3 = Host.create(name: "Jamie", email: "jamie@mail.com", username: "gifft", password: "passh3")
host4 = Host.create(name: "Andrew", email: "andrew@mail.com", username: "aye", password: "passh4")
host5 = Host.create(name: "Anthony", email: "anthony@mail.com", username: "jakt", password: "passh5")


e1 = Event.create(name: "welcome to hell", description: "popup shop", date: "2/2/20", time: "12:00pm", location: "Queens", host_id: host1.id)
e2 = Event.create(name: "uptown function", description: "house party", date: "1/1/20", time: "11:00pm", location: "Harlem", host_id: host2.id)
e3 = Event.create(name: "new years bash", description: "club party", date: "1/1/20", time: "10:00pm", location: "Midtown", host_id: host3.id)
e4 = Event.create(name: "icy winter", description: "listening party", date: "2/10/20", time: "7:30pm", location: "Soho", host_id: host4.id)
e5 = Event.create(name: "hack n slash", description: "hackathon", date: "10/31/19", time: "10:00am", location: "Bronx", host_id: host5.id)

g1 = Guest.create(name: "keenan", email: "k@keenan.com")
g2 = Guest.create(name: "pat", email: "pat@pineapple.com")
g3 = Guest.create(name: "louise", email: "louise@pineapple.com")
g4 = Guest.create(name: "sil", email: "sil@pineapple.com")
g5 = Guest.create(name: "rob", email: "rob@pineapple.com")
g6 = Guest.create(name: "jessica", email: "jess@pineapple.com")
g7 = Guest.create(name: "jillian", email: "jill@pineapple.com")
g8 = Guest.create(name: "marie", email: "marie@pineapple.com")
g9 = Guest.create(name: "scott", email: "scott@pineapple.com")
g10 = Guest.create(name: "ruth", email: "ruth@pineapple.com")
g11 = Guest.create(name: "phyllis", email: "phyllis@pineapple.com")
g12 = Guest.create(name: "mia", email: "mia@pineapple.com")


inv1 = Invite.create(guest_id: g1.id, event_id: e1.id)
inv2 = Invite.create(guest_id: g2.id, event_id: e1.id)
inv3 = Invite.create(guest_id: g3.id, event_id: e1.id)
inv4 = Invite.create(guest_id: g4.id, event_id: e2.id)
inv5 = Invite.create(guest_id: g5.id, event_id: e2.id)
inv6 = Invite.create(guest_id: g6.id, event_id: e2.id)
inv7 = Invite.create(guest_id: g7.id, event_id: e3.id)
inv8 = Invite.create(guest_id: g8.id, event_id: e3.id)
inv9 = Invite.create(guest_id: g9.id, event_id: e4.id)
inv10 = Invite.create(guest_id: g10.id, event_id: e4.id)
inv11 = Invite.create(guest_id: g11.id, event_id: e5.id)
inv12 = Invite.create(guest_id: g12.id, event_id: e5.id)
inv13 = Invite.create(guest_id: g1.id, event_id: e5.id)




