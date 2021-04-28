require "application_system_test_case"

class AdminVerificationRunCreateTest < ApplicationSystemTestCase
  setup do
    admin = users(:mia)
    admin.confirm
    sign_in admin

    @app_recipe = app_recipes(:test_app)
  end

  test "Running AppRecipe creates VerificationRun" do
    visit admin_app_recipes_path
    run_app_recipe

    # 1.upto(30) do
    #   if app_recipe_status == "running_ci"
    #     puts "app_recipe_status is running_ci!"
    #     break 
    #   else
    #     puts "waiting on jobs to complete, app_recipe_status is #{app_recipe_status}"
    #   end
    #   sleep 1
    # end

    assert_equal "running_ci", app_recipe_status
  end

  private

  def run_app_recipe
    find(:xpath, "//td[@data-title='#{@app_recipe.name}']/following-sibling::td[descendant::input[@value='Run']]").click
  end

  def app_recipe_status
    find(:xpath, "//td[@data-title='#{@app_recipe.name}']/following-sibling::td[@data-progression]").text
  end
end
