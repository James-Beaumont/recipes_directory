require_relative './lib/database_connection'
require_relative './lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')

recipes = DatabaseConnection.exec_params('SELECT * FROM recipes', [])

recipe = RecipeRepository.new

recipe.all.each do |item|
    puts "#{item.id} #{item.name} #{item.cooking_time}mins Rating: #{item.rating}"
end



