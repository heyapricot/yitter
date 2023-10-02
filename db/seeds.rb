User.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "main@example.com",
  password: "password",
})

10.times do
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
  })
end

