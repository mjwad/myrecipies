class AddChefIdToRecipies < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :chef_id, :integer
  end
end
