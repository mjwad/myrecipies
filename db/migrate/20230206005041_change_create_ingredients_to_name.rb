class ChangeCreateIngredientsToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :ingredients, :CreateIngredients, :name
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
