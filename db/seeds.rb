# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
Comment.destroy_all

10.times do
City.create(
  name: Faker::Address.city,
  zip_code: Faker::Address.zip_code
)
end

User.create(
  first_name: "Fox", 
  last_name: "Mulder", 
  description: "I want to believe",
  email: "zone51@email.com",
  password: "xfiles",
  password_confirmation: "xfiles",
  age:rand(13..100),
  city_id: City.all.sample.id
)


15.times do
@password = Faker::Code.imei
User.create(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name, 
  description: Faker::Movie.quote,
  email: Faker::Internet.email,
  password: @password,
  password_confirmation: @password,
  age:rand(13..100),
  city_id: City.all.sample.id
)
end

100.times do
Gossip.create(
  title: Faker::Book.title,
  content: Faker::TvShows::Buffy.quote,
  user_id: User.all.sample.id
)
end

70.times do
  Comment.create(
    content: Faker::TvShows::TwinPeaks.quote,
    user_id: User.all.sample.id,
    gossip_id: Gossip.all.sample.id
  )
end

10.times do
Tag.create(title: "#" + Faker::Verb.base)
end
