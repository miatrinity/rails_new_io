require "application_system_test_case"

class AdminVerificationRunCreateTest < ApplicationSystemTestCase
  setup do
    admin = users(:mia)
    admin.confirm
    sign_in admin

    @app_recipe = app_recipes(:stimulus_reflex_rspec_bootstrap)
  end

  test "Running AppRecipe creates VerificationRun" do
    mock = Minitest::Mock.new
    def mock.perform
      true
    end

    RecreateRepository.stub :new, mock do
      visit admin_app_recipes_path
      run_app_recipe
    end

    assert app_recipe_status, "running_ci"
  end

  private

  def run_app_recipe
    find(:xpath, "//td[@data-title='#{@app_recipe.name}']/following-sibling::td[descendant::input[@value='Run']]").click
  end

  def app_recipe_status
    find(:xpath, "//td[@data-title='#{@app_recipe.name}']/following-sibling::td[@data-progression]").text
  end
end
