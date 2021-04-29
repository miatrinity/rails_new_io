require "application_system_test_case"

class AdminAppRecipeIndexTest < ApplicationSystemTestCase
  setup do
    admin = users(:mia)
    admin.confirm
    sign_in admin

    @app_recipe = app_recipes(:recipe_with_successful_run)
    @last_verification_run = @app_recipe.verification_runs.last
  end

  test "App recipes are correctly rendered in admin index view" do
    visit admin_app_recipes_path

    assert_text @app_recipe.name
    assert_text "SUCCESS"
    assert_text "less than a minute ago"
  end
end
