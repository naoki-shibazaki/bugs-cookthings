class ChangeRecipesColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :recipe_name, :string, limit: 255
    change_column :recipes, :category, :string, limit: 255

  end
end
