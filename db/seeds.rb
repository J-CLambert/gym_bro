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

gym_descriptions = [
    "A private gym with a wide array of high-quality equipment in a well-lit space.",
    "Modern fitness room with all the amenities for a comprehensive workout.",
    "Welcoming gym with an atmosphere conducive to personal training.",
    "A perfect spot for fitness enthusiasts with a variety of equipment and plenty of space.",
    "An upscale gym featuring state-of-the-art machines and equipment for a superior workout experience.",
    "An intimate and well-equipped gym offering a serene environment for focused exercise.",
    "Professional-grade fitness center that blends a prime location with impeccable design.",
    "A high-energy gym space designed to inspire and motivate your fitness journey.",
    "Fully equipped gym featuring the latest in fitness technology for a comprehensive training regimen.",
    "A vibrant and spacious gym with top-notch facilities designed for optimal workouts.",
    "Cutting-edge gym that offers a diverse range of equipment and a spacious workout environment.",
    "An urban gym sanctuary with an extensive array of machines and weights for every fitness level.",
    "A friendly neighborhood gym that provides a well-rounded approach to health and wellness.",
    "High-performance gym designed to challenge and motivate both novice and seasoned fitness enthusiasts.",
    "Invigorating gym space packed with advanced equipment and great facilities for a rewarding workout.",
    "A sleek and modern gym that provides the perfect environment for a balanced fitness regimen.",
    "A well-appointed gym that blends functionality and style, promoting a superior workout experience.",
    "State-of-the-art fitness center that provides a diverse range of workout options.",
    "A serene gym environment that caters to all fitness levels with a range of high-quality equipment.",
    "Dynamic gym offering an impressive lineup of equipment and facilities for a unique workout experience."
  ]
  

puts 'Creating 10 fake users...'
5.times do
    mail = Faker::Internet.email
    user = User.create!(
        email: mail,
        password: mail
    )

    puts 'Creating 20 fake gyms per user...'
    3.times do
        gym = Gym.create!(
            title: Faker::Company.name,
            address: Faker::Address.full_address,
            description: gym_descriptions.sample, # choose a random description from the array
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
