require 'recipe_repository'

RSpec.describe RecipeRepository do
    
    def reset_recipes_table
        seed_sql = File.read('spec/seeed_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
        connection.exec(seed_sql)
      end
      
        describe RecipeRepository do
        before(:each) do 
          reset_recipes_table
        end

        it 'returns all recipes' do
            repo = RecipeRepository.new

            recipe = repo.all

            expect(recipes.length).to eq 3
            expect(recipes[0].id).to eq '1'
            expect(recipes[0].name).to eq 'Pizza'
            expect(recipes[0].cooking_time).to eq '30'
            expect(recipes[0].rating).to eq 5
        end
            
        it 'returns recipe based on id' do
            repo = RecipeRepository.new

            recipe = repo.find(1)

            expect(recipe.id).to eq 1
            expect(recipe.name).to eq 'Pizza'
            expect(recipe.cooking_time).to eq '30'
            expect(recipe.rating).to eq 5
        end
    end
end