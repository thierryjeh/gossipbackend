User.destroy_all # Remise à 0
City.destroy_all # Remise à 0
Gossip.destroy_all # Remise à 0
Tag.destroy_all # Remise à 0
GossipTag.destroy_all # Remise à 0
PrivateMessage.destroy_all # Remise à 0



10.times do # Création de 10 villes aléatoires avec des zip_code aléatoires
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do # Je définis 10 users aléatoirement et je lui affecte une des 10 villes créées
  User.create(first_name: Faker::Superhero.prefix, last_name: Faker::Superhero.suffix, description: Faker::Quote.yoda, email: Faker::Internet.email, age: Faker::Number.within(range: 15..50), city: City.all[rand(0..9)])
end

20.times do # Création de 20 gossips. Chaque gossip est attribué aléatoirement à un des users (un user peut ne pas avoir de gossip)
  Gossip.create(title: Faker::Movies::HarryPotter.spell, content: Faker::Quote.yoda, user: User.all[rand(0..9)])
end

10.times do # Création de 10 tags aléatoires
  Tag.create(title: Faker::Movies::HarryPotter.spell)
end

Gossip.all.each do |gossip| # Chaque gossip a aléatoirement 2 tags
  GossipTag.create(gossip: gossip, tag: Tag.all[rand(0..9)])
  GossipTag.create(gossip: gossip, tag: Tag.all[rand(0..9)])
end


10.times do # We create 10 messages that will be sent by 1 person and received by someone random. One person can receive several messages
  pm = PrivateMessage.create(content: Faker::Quote.most_interesting_man_in_the_world, sender: User.all[rand(0..9)], recipient: User.all[rand(0..9)])
end