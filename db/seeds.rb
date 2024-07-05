# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin',
  password: 'testtest'
)

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
