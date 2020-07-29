class ChangeColumnRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :calenders_id, :calender_id
  end
end
