# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create!([{name: "Technical"}, {name: "Gossip"}, {name: "Politics"}])
tech = Category.where(name: "Technical").first
gossip = Category.where(name: "Gossip").first
politics = Category.where(name: "Politics").first

Article.create({title: "Everything you ever wanted to know about querying with Active Record", body: "If you're used to using raw SQL to find database records, then you will generally find that there are better ways to carry out the same operations in Rails. Active Record insulates you from the need to use SQL in most cases.", category: tech})
Article.create({title: "Active Record queries sometimes return an Active Relation", body: "And that can be confusing at times", category: tech})

Article.create({title: "Taylor Swift", body: "I saw a concert about 4 years ago with my daughter and I was impressed with her singing and her message", category: gossip})
Article.create({title: "Katy Perry", body: "Saw her at the superbowl", category: gossip})

Article.create({title: "Political campaigns are getting crazy!", body: "Money + antics, this is going to be a very interesting political election", category: politics})
Article.create({title: "There are so many candidates", body: "How is anybody supposed to pick one!", category: politics})

tech_articles = Article.where(category: tech)
a1 = tech_articles.first
a2 = tech_articles.last

gossip_articles = Article.where(category: gossip)
a3 = gossip_articles.first
a4 = gossip_articles.last

politics_articles = Article.where(category: politics)
a5 = politics_articles.first
a6 = politics_articles.last

Tag.create!([{name: "Funny", article: a4}, 
             {name: "Interesting", article: a1}, 
             {name: "Outrageous", article: a5}, 
             {name: "Confusing", article: a2}, 
             {name: "Infuriating", article: a6}, 
             {name: "Cool", article: a3}])
adjectives1 = %w{aggressive agile agitated agonizing agreeable ajar alarmed alarming alert alienated alive altruistic}
adjectives1.each{|adjective| Tag.create!(name: adjective, article:a1)}

adjectives2 = %w{cloudy clueless clumsy cluttered coarse cold colorful colorless colossal comfortable common compassionate competent complete}
adjectives2.each{|adjective| Tag.create!(name: adjective, article:a2)}

adjectives3 = %w{embellished eminent emotional empty enchanted enchanting energetic enlightened enormous}
adjectives3.each{|adjective| Tag.create!(name: adjective, article:a3)}

adjectives4 = %w{gloomy glorious glossy glum golden good good-natured gorgeous graceful}
adjectives4.each{|adjective| Tag.create!(name: adjective, article:a4)}

adjectives5 = %w{impeccable impartial imperfect imperturbable impish impolite important impossible impractical impressionable impressive improbable}
adjectives5.each{|adjective| Tag.create!(name: adjective, article:a5)}

adjectives6 = %w{kaleidoscopic keen key kind kindhearted kindly klutzy knobby knotty knowledgeable knowing known kooky kosher}
adjectives6.each{|adjective| Tag.create!(name: adjective, article:a6)}

(1..18).each do |i|
  id = (i % 6) + 1
  article = Article.find(id)
  comment = Comment.create!(article: article, body: Faker::Lorem.sentence(2, true, 6))
  Guest.create!(name: Faker::Name.first_name, comment: comment)
end
