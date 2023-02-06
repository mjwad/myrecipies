class ChangeRecipesingredientsToRecipeingredients < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipes_ingredients, :recipe_ingredients
  end
end
