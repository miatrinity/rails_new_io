require "application_system_test_case"

class AdminAppRecipeIndexTest < ApplicationSystemTestCase
  setup do
    @app_recipe = app_recipes(:stimulus_tailwind)
    @last_verification_run = @app_recipe.verification_runs.last
  end

  test "App recipes are correctly rendered in admin index view" do
    visit admin_app_recipes_path

    assert_text @app_recipe.title
    assert_text @last_verification_run.status
    assert_text "#{time_ago_in_words(@last_verification_run.finished_at)} ago"
  end
end
