# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

puts "Destroying all records..."

sleep(2)

puts "Creating new ingredients..."
sleep(2)

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)
ingredient['drinks'].each do |thing|
  Ingredient.create(name: thing['strIngredient1'])
end

puts "Finished!"
