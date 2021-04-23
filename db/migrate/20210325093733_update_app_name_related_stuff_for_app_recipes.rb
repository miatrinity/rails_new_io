class UpdateAppNameRelatedStuffForAppRecipes < ActiveRecord::Migration[6.1]
  def change
    change_table :app_recipes do |t|
      t.rename :title, :name

      t.string :app_name
      t.references :user, foreign_key: true

      # t.index ["app_name", "user_id"], name: "index_app_name_and_user_id", unique: true
    end
  end
end
