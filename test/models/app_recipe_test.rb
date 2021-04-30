require "test_helper"

class AppRecipeTest < ActiveSupport::TestCase
  test "AppRecipe name is correctly set when creating an AppRecipe" do
    mia = users(:mia)
    app_recipe = AppRecipe.create(user: mia, name: "Mia's 1st recipe + yummies!")

    assert_equal "Mia_s_1st_recipe___yummies_", app_recipe.app_name
  end

  test "AppRecipe name is correctly set when updating an AppRecipe" do
    app_recipe = app_recipes(:test_app)
    app_recipe.update(name: "Updated name")

    assert_equal "Updated_name", app_recipe.reload.app_name
  end
end
