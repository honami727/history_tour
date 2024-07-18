# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

taro = User.find_or_create_by!(email: "taro@example.com") do |user|
  user.name = "Taro"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

jiro = User.find_or_create_by!(email: "jiro@example.com") do |user|
  user.name = "Jiro"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

hanako = User.find_or_create_by!(email: "hanako@example.com") do |user|
  user.name = "Hanako"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

category_names = %w(
　弥生時代
　古墳時代
  飛鳥時代
  奈良時代
  平安時代
  鎌倉時代
  室町時代
  戦国時代
  安土桃山時代
  江戸時代
  明治時代
  大正時代
  昭和時代
)

category_names.each do |name|
  Category.create!(name: name)
end

Spot.find_or_create_by!(title: "大阪城") do |spot|
  spot.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  spot.person = "豊臣秀吉"
  spot.category_id = 9
  spot.address = "大阪府"
  spot.body = "豊臣秀吉が拠点としました。"
  spot.user = taro
  spot.created_at = Time.now
  spot.updated_at = Time.now
end

Spot.find_or_create_by!(title: "二条城") do |spot|
  spot.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  spot.person = "徳川慶喜"
  spot.category_id = 10
  spot.address = "京都府"
  spot.body = "大政奉還が行われました。"
  spot.user = jiro
  spot.created_at = Time.now
  spot.updated_at = Time.now
end

Spot.find_or_create_by!(title: "金閣寺") do |spot|
  spot.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  spot.person = "足利義満"
  spot.category_id = 7
  spot.address = "京都府"
  spot.body = "足利義満によって建てられた、北山文化を第方する建造物です。"
  spot.user = hanako
  spot.created_at = Time.now
  spot.updated_at = Time.now
end

Admin.create!(
  email: 'admin@admin',
  password: 'testtest'
)
