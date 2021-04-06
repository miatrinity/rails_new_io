require "application_system_test_case"

class AdminAppRecipeIndexTest < ApplicationSystemTestCase
  setup do
    @app_recipe = app_recipes(:recipe_with_single_run)
    @last_verification_run = @app_recipe.verification_runs.last
  end

  test "App recipes are correctly rendered in admin index view" do
    visit admin_app_recipes_path

    assert_text @app_recipe.name
    assert_text @last_verification_run.status
    assert_text "1 day ago"
  end
end
