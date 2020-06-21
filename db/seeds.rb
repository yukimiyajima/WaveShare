10.times do |n|
  name = Faker::JapaneseMedia::DragonBall.character
  email = Faker::Internet.email
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    icon: open("./db/surfers/icon#{n}.jpg")
  )
end

User.all.each do |user|
  contents = ['いい波です', 'Good!', 'Fun Wave!', 'Small Wave', 'Surf!']
  user.topics.create!(
    title: contents[rand(0..4)],
    content: contents[rand(0..4)],
    lat: rand(35.31500..35.319000).round(6), 
    lng: rand(139.360000..139.480000).round(6),
    image: open("./db/waves/img0.jpg"),
  )
end

20.times do |n|
  Like.create!(
    user_id: rand(1..10),
    topic_id: rand(1..10),
  )
end