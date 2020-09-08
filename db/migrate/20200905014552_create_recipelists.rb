class CreateRecipelists < ActiveRecord::Migration[6.0]
  def change
    create_table :recipelists do |t|
      t.string :recipe_name
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
