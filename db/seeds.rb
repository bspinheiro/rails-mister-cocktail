# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require 'open-uri'
require 'json'

url = open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
json = ActiveSupport::JSON.decode(url)

json.each do |a|
  # byebug
  # a[1][0]["strIngredient1"]
  a[1].each do |ingredient|
    Ingredient.create(name: ingredient["strIngredient1"])
  end
end

