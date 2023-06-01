# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Deleting previous bookings'
Booking.delete_all
puts 'Deleting previous gyms'
Gym.delete_all
puts 'Deleting previous users'
User.delete_all

puts 'Creating 10 fake users...'
10.times do
    mail = Faker::Internet.email
    user = User.create!(
        email: mail,
        password: mail
    )

    puts 'Creating 20 fake gyms per user...'
    20.times do
        gym = Gym.create!(
            title: Faker::Company.name,
            address: Faker::Address.full_address,
            description: Faker::Lorem.paragraph,
            priceph: Faker::Commerce.price(range: 10..50),
            user_id: user.id
        )

        puts 'Creating bookings for the gym...'
        Booking.create!(
            price: gym.priceph * 2, # this is just an example, replace with your logic
            start_at: Date.today,
            user_id: user.id,
            gym_id: gym.id,
            traning_started_at: Date.today,
            traning_ended_at: Date.today + 2.days, # this is just an example, replace with your logic
            status: 0,
            message: "I would like to book this gym.",
            duration: 2 # this is just an example, replace with your logic
        )
    end
end

