require_relative "./recipe.rb"
class RecipeRepository
    
    
    def all
        sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
        recipe_set = DatabaseConnection.exec_params(sql, [])

        recipes = []

        recipe_set.each do |item|
            new_recipe = Recipe.new 
            
            new_recipe.id = item['id']
            new_recipe.name = item['name']
            new_recipe.cooking_time = item['cooking_time']
            new_recipe.rating = item['rating']

            recipes << new_recipe
        end

        return recipes

        # Returns an array of Student objects.
    end

    def find(id)
        # Executes the SQL query:
        sql = 'SELECT * FROM recipes WHERE id = $1'
        param = [id]
    
        recipe_set = DatabaseConnection.exec_params(sql, param)

        recipes = []

        recipe_set.each do |item|
            new_recipe = Recipe.new 
            
            new_recipe.id = item['id']
            new_recipe.name = item['name']
            new_recipe.cooking_time = item['cooking_time']
            new_recipe.rating = item['rating']

            recipes << new_recipe
        end

        return recipes

        # Returns an array of Student objects.
    end
      
end