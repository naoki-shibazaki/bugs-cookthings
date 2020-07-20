class CreateFoodStuffs < ActiveRecord::Migration[6.0]
  def change
    create_table :food_stuffs do |t|
      t.string   :food_stuff, limit: 60
      t.integer  :amount, limit: 4
      t.string   :mass, limit: 10
      t.timestamps
    end
  end
end
