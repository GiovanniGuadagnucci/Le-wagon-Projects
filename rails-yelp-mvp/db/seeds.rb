# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
types = ["chinese", "italian", "japanese", "french", "belgian"]
5.times do
  Restaurant.create(name: Faker::Games::WorldOfWarcraft.hero, address: Faker::Games::Zelda.location, category: types[rand(0..4)])
end
