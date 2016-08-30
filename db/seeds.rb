require 'faker'

def create_static_user(attrs = {})
  unless User.find_by_email(attrs[:email])
    User.create!( attrs )
    puts "Static User Created. email: \"#{attrs[:email]}\" password: \"#{attrs[:password]}\""
  else
    puts "User \"#{attrs[:email]}\" found. Skipping creation." 
  end
end

# Create Users
10.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
end


create_static_user(
  name: "admin",
  email: "admin@blocipedia.com",
  password: "password1234"
)

create_static_user(
  name: "admin example",
  email: "admin@example.com",
  password: "helloworld"
)


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
