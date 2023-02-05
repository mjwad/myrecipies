class CreateRecipesIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.timestamps
    end
  end
end
