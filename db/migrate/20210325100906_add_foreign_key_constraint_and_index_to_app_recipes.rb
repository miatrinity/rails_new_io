class AddForeignKeyConstraintAndIndexToAppRecipes < ActiveRecord::Migration[6.1]
  def change
    change_table :app_recipes do |t|
      change_column_null :app_recipes, :user_id, false
      t.index ["app_name", "user_id"], name: "index_app_name_and_user_id", unique: true
    end
  end
end
