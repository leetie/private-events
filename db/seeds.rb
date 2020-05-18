# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |i|
  User.create(name: "test_user", username: "Agent #{rand(0..100)}")
end

120.times do |i|
  rando = rand(1..(User.count))
  User.find(rando).events.create(title: "random event", description: "auto-generated event", date: Time.new(rand(1999..2030), rand(1..12))
)
end