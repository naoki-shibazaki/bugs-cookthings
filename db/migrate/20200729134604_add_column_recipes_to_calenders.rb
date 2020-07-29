class AddColumnRecipesToCalenders < ActiveRecord::Migration[6.0]
  def change 
    add_reference :recipes, :calenders, foreign_key: true 
  end
end
