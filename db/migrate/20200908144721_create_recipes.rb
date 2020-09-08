class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_name, limit: 255
      t.string :category, limit: 255
      t.datetime :cook_at
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
