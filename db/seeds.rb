# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users have email, about_me, purpose, username
users = [
  {email: "vanessanimmo@live.com", password: "password", password_confirmation: "password",
  about_me: "I'm a student who is really excited about code.",
  purpose: "I'm looking for a mentor to find out which areas of code I should study.",
  username: "Ness"},
  {email: "nimmovanessa@gmail.com", password: "password", password_confirmation: "password",
  about_me: "I'm a senior dev at Big Company in Melbourne.",
  purpose: "I'd like to mentor someone to give back to an industry that has given lots to me.",
  username: "Vanessa"},
  {email: "me@email.com", password: "password", password_confirmation: "password",
    about_me: "I'm an experience React developer.",
    purpose: "I'd like to do some technical teaching and improve my communicatio skills.",
    username: "Joshua"}
]

mentors = [
  {user_id: 2,
  skills: "General tech career in Melbourne",
  availability: "CBD lunch and after work on weekdays",
  price: 100},
  {user_id: 3,
  skills: "React, JS, Node",
  availability: "Weekday evenings, Saturday afternoons",
  price: 1200}
]

bookings = [
  {mentor_id: 2,
  mentee_id: 1,
  price: 100
  },
  {mentor_id: 3,
  mentee_id: 1,
  price: 1200
  }
]

Booking.delete_all
Mentor.delete_all
User.delete_all

users.each do |user|
  User.create(email: user[:email], password: user[:password], password_confirmation: user[:password_confirmation], username: user[:username], purpose: user[:purpose], about_me: user[:about_me])
end

mentors.each do |mentor|
  Mentor.create(user_id: mentor[:user_id], skills: mentor[:skills], availability: mentor[:availability], price: mentor[:price])
end

bookings.each do |booking|
  Booking.create(mentor_id: booking[:mentor_id], mentee_id: booking[:mentee_id],price: booking[:price])
end