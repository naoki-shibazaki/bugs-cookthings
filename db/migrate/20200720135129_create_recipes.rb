class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    #レシピ＝t
    create_table :recipes do |t| 
      t.string   :recipe_name
      t.string   :category
      t.timestamps
    end
  end
end
