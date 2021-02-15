require "application_system_test_case"

class AdminVerificationRunCreateTest < ApplicationSystemTestCase
  setup do
    @app_recipe = app_recipes(:stimulus_reflex_rspec_bootstrap)
  end

  test "Running AppRecipe creates VerificationRun" do
    visit admin_app_recipes_path
    run_app_recipe

    assert_text app_name_output
    assert_text rails_new_command_output
  end

  private

  def run_app_recipe
    find(:xpath, "//td[@data-title='#{@app_recipe.title}']/following-sibling::td[descendant::input[@value='Run']]").click
  end

  def app_name_output
    "App Name is: Stimulus_Reflex___RSpec___Bootstrap"
  end

  def rails_new_command_output
    "Rails New Command is: echo Stimulus_Reflex___RSpec___Bootstrap --skip-test --template https://www.railsbytes.com/script/zyvso6"
  end
end
