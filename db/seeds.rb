User.destroy_all
User.create!([
{email: "pat@test.com", password: "12345678",encrypted_password:"12345678", password_confirmation:"12345678",  first_name: "pat", last_name: "McKracky", uid:"001", name: "Pat McKracky", image: "https://randomuser.me/api/portraits/med/men/95.jpg"},
{email: "arnold_rice@random.com",  password: "12345678",encrypted_password:"12345678", password_confirmation:"12345678", first_name: "Arnold", last_name: "Rice", uid:"002", name: "Arnold Rice", image: "https://randomuser.me/api/portraits/med/men/53.jpg"},
{email: "Judith_Wilson@example.com",  password: "12345678",encrypted_password:"12345678",password_confirmation:"12345678", first_name: "Judith", last_name: "Wilson", uid:"003", name: "Judith Wilson", image: "https://randomuser.me/api/portraits/med/women/78.jpg"},
{email: "Madison_Young@example.com",  password: "12345678",encrypted_password:"12345678",password_confirmation:"12345678", first_name: "Madison", last_name: "Young", uid:"004", name: "Madison Young", image: "https://randomuser.me/api/portraits/med/women/49.jpg"},
{email: "Maxine Hanson@example.com",  password: "12345678",encrypted_password:"12345678",password_confirmation:"12345678", first_name: "Maxine", last_name: "Hanson", uid:"005", name: "Maxine Hanson", image: "https://randomuser.me/api/portraits/med/women/53.jpg"},
  ])

puts "there are now #{User.count} users in the database"

Attendance.destroy_all
Attendance.create!([
  {user_uid: "001",  event_id: "1"},
  {user_uid: "002", event_id: "1"},
  {user_uid: "003", event_id: "1"},
  {user_uid: "004",  event_id: "1"},
  {user_uid: "002", event_id: "2"},
  {user_uid: "003", event_id: "2"},
{user_uid: "005",  event_id: "3"},
  {user_uid: "004", event_id: "3"},
  {user_uid: "003", event_id: "3"},
  {user_uid: "001",  event_id: "3"},
  {user_uid: "002", event_id: "4"},
  {user_uid: "003", event_id: "4"},
  {user_uid: "004",  event_id: "5"},
  {user_uid: "005", event_id: "5"},
  {user_uid: "003", event_id: "5"}
])

puts "there are now #{Attendance.count} Attendances in the database"


Comment.destroy_all
Comment.create!([
  {content: "lame", user_uid: "002", event_id: 1},
    {content: "awesome", user_uid: "003", event_id: 1},
     {content: "I farted in the salad", user_uid: "005", event_id: 4},
     {content: "I'm pregnant", user_uid: "004", event_id: 1},
])

puts "there are now #{Comment.count} comments in the database"

Event.destroy_all
Event.create!([
  {location: "Pat's Pitty ", description: "Just a real sad time", start_date: "2015-06-20 19:09:00", end_date: "2015-06-20 19:09:00", invite_only: false, creator_uid: "001"},
  {location: "Dive Bar Life", description: "Shots", start_date: "2015-06-20 20:40:00", end_date: "2015-06-20 20:40:00", invite_only: true, creator_uid: "001"},
  {location: "Sean's crying room", description: "Does anyone want to come and watch me cry", start_date: "2015-06-22 18:05:00", end_date: "2015-06-22 18:05:00", invite_only: false, creator_uid: "002"},
  {location: "Wrigley", description: "shots ", start_date: "2015-06-22 10:05:00", end_date: "2015-06-22 18:05:00", invite_only: true, creator_uid: "003"},
  {location: "Wicker Park", description: "People watching to the max", start_date: "2015-06-23 01:11:00", end_date: "2015-06-23 01:11:00", invite_only: false, creator_uid: "003"},
])
puts "there are now #{Event.count} Events in the database"


Friendship.destroy_all
Friendship.create!([
  {sender_uid: "001", reciever_uid: "002", accepted: true},
  {sender_uid: "001", reciever_uid: "003", accepted: true},
  {sender_uid: "001", reciever_uid: "004", accepted: true},
  {sender_uid: "005", reciever_uid: "001", accepted: false},
  {sender_uid: "002", reciever_uid: "003", accepted: true},
  {sender_uid: "002", reciever_uid: "004", accepted: false},
  {sender_uid: "002", reciever_uid: "005", accepted: false},
  {sender_uid: "003", reciever_uid: "004", accepted: true},
  {sender_uid: "003", reciever_uid: "005", accepted: true},
  {sender_uid: "004", reciever_uid: "005", accepted: true}])
puts "there are now #{Friendship.count} Friend Requests in the database"


Invite.destroy_all
Invite.create!([
  {sender_uid:"002"}, recipient_uid: "001", event_id: 2])
puts "there are now #{Invite.count} Invites in the database"










# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
