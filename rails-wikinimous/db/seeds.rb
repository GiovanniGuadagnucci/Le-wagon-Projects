require 'faker'
10.times do
  new_article = Article.new(title: Faker::Games::WorldOfWarcraft.hero, content: Faker::Games::WorldOfWarcraft.quote)
  new_article.save
end
