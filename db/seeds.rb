require 'faker'

def create_static_user(attrs = {})
  unless User.find_by_email(attrs[:email])
    user = User.new( attrs )
    user.skip_confirmation!
    user.save!
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
30.times do
  Wiki.create!(
    title: Faker::ChuckNorris.fact,
    body:  Faker::Hipster.paragraph,
    user:  users.sample
  )
end

20.times do
  wiki = Wiki.new(
    title: Faker::ChuckNorris.fact,
    body:  Faker::Hipster.paragraph,
    user:  users.sample,
    private: true
  ) 
  other_users = users - [wiki.user]
  wiki.users = other_users.sample(5)
  wiki.save!
end

wikis = Wiki.all
puts "#{wikis.count} wikis created."

puts "Seed finished"
