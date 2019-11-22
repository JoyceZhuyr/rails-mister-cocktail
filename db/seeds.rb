require 'open-uri'
require 'json'
Cocktail.destroy_all
Ingredient.destroy_all

Cocktail.create(name: "Test0")
Cocktail.create(name: "test1")
Cocktail.create(name: "test2")
Cocktail.create(name: "test3")

Ingredient.create(name: "01")
Ingredient.create(name: "02")
Ingredient.create(name: "03")
Ingredient.create(name: "04")

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized_ingredients = open(url).read
ingredients = JSON.parse(serialized_ingredients)

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "#{Ingredient.count}"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
