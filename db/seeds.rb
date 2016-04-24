# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

titles = [
  'Ножи',
  'Палатки',
  'Коврики',
  'Веревки',
  'Обувь'
]

titles.each { |i| Category.create(title: i) }

#   Products should have name, description, image, price, category_id
categories_ids = Category.pluck(:id)
15.times do
  Product.create!(name:       Faker::Commerce.product_name,
                 description: Faker::Lorem.paragraph,
                 photo:       Faker::Avatar.image,
                 price:       Faker::Commerce.price,
                 category_id: categories_ids.sample
                 )
end
