class AddAppRecipeRefToVerificationRun < ActiveRecord::Migration[6.0]
  def change
    add_reference :verification_runs, :app_recipe, null: false, foreign_key: true
  end
end
