require "application_system_test_case"

class AdminAppRecipeIndexTest < ApplicationSystemTestCase
  setup do
    @app_recipe = app_recipes(:stimulus_tailwind)
    @last_verification_run = VerificationRun.last
  end

  test "App recipes are correctly rendered in admin index view" do
    visit admin_app_recipes_path

    assert_text @app_recipe.title
    assert_text @last_verification_run.status
    assert_text "less than a minute ago"
  end
end
