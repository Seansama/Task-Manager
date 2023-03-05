puts "Seeding..."

10.times do
  user = User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
  )
end

puts "Seeding Complete!!!"