class CreateAppRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :app_recipes do |t|
      t.string :title
      t.text :instructions, :description

      t.timestamps
    end
  end
end
