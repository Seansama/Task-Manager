puts "Seeding..."

10.times do
  user = User.create(
    name: Faker::Name.username,
    email: Faker::Internet.email,
    password: "password"
  )
end

puts "Seeding Complete!!!"