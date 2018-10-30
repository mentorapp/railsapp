# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users have email, about_me, purpose, username
users = [
  {email: "vanessanimmo@live.com",
  about_me: "I'm a student who is really excited about code.",
  purpose: "I'm looking for a mentor to find out which areas of code I should study.",
  username: "Ness"},
  {email: "nimmovanessa@gmail.com",
  about_me: "I'm a senior dev at Big Company in Melbourne.",
  purpose: "I'd like to mentor someone to give back to an industry that has given lots to me.",
  username: "Vanessa"}
]
