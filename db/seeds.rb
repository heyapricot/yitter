User.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "main@example.com",
  password: "password",
})

6.times do
  user = User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
  })

  sentence_count = Random.rand(10..50)
  user.posts.create!({
    content: Faker::Lorem.paragraph(sentence_count: sentence_count),
  })
end

