# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Creating 10 fake user...'
10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
end

10.times do
  user = User.last
  puts 'Creating 20 fake gym per user...'
  20.times do
    Gym.create(
      title: Faker::Company.name,
      address: Faker::Address.full_address,
      description: Faker::Lorem.paragraph,
      priceph: Faker::Commerce.price(range: 10..50),
      user_id: user.id
    )
  end
end
