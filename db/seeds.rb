# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# UserとProfileのテストデータを10件作成する
30.times do |_n|
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

commitment = ['週1回', '週2〜3回', '週4〜5回', '毎日', '']
position = ['バックエンド', 'フロントエンド', 'レビュー', 'アドバイザー', '希望なし', '']
motivation = ['ガチで作成したい', 'ゆるく楽しく作成したい', 'サポートしたい', '']
self_introduction = ['こんにちは', 'よろしくお願いします', 'がんばっていきます所存でございます,よろしくオコンニチハ', '']
phase = ['カリキュラム中', 'PF作成中', '就活中', '現役エンジニア', '']
grade = ['1', '10', '20', '30', '40', '']
editor = ['Visual Studio Code', 'Atom', 'Vim', 'NoEditor', 'Sublime Text', '']

# 作成したUserのidを使ってProfileを作成する
users.each do |user|
  profile = Profile.new(
    times_link: AFaker::Games::Pokemon.name,
    commitment: commitment.sample,
    position: position.sample,
    motivation: motivation.sample,
    self_introduction: self_introduction.sample,
    phase: phase.sample,
    grade: grade.sample,
    editor: editor.sample,
    user_id: user
  )
  profile.save
end
