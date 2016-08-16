# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create Users
10.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
end

# Create Admin
unless User.find_by(email: "admin@blocipedia.com")
  admin = User.create!(
    name: "admin",
    email: "admin@blocipedia.com",
    password: "password1234",
    )
end

users = User.all
puts "#{User.count} users created."

# Create Wikis
20.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph,
    user:  users.sample
  )
end

wikis = Wiki.all
puts "#{wikis.count} wikis created."

puts "Seed finished"
