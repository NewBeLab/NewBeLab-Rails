# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# UserとProfileのテストデータを10件作成する
10.times do |n|
  User.create!(
    provider: 'gihub',
    uid: Faker::Number.number(digits: 8),
    name: Faker::Games::Pokemon.name,
    email: nil,
    password: Faker::Internet.password(min_length: 8),
    image: Faker::Avatar.image
  )
end

# 作成したUserのidを取得
users = User.pluck(:id)

# 作成したUserのidを使ってProfileを作成する

users.each do |user|
  profile = Profile.new(
    times_link: Faker::Games::Pokemon.name,
    commitment: Faker::Lorem.word,
    position: Faker::Lorem.word,
    motivation: Faker::Lorem.word,
    self_introduction: Faker::Lorem.paragraph,
    phase: Faker::Lorem.word,
    grade: Faker::Number.between(from: 1, to: 40),
    editor: 'vim',
    user_id: user
  )
  profile.save
end
