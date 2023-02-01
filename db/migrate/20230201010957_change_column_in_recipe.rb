class ChangeColumnInRecipe < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :email, :description
    change_column :recipes, :description, :text
  end
end
