require "view_component/test_case"
require "test_helper"

module Admin
  module AppRecipes
    module LastRun
      class ComponentTest < ViewComponent::TestCase
        def test_render_app_recipe_that_never_ran
          render_inline(Admin::AppRecipes::LastRun::Component.new(app_recipe: app_recipes(:never_ran)))

          assert_selector("td[data-title]", text: "I never ran")
          assert_selector("td[data-time-passed]", text: "No Finished Runs - Yet")
          assert_selector("td[data-progression]", text: "")
        end

        def test_render_app_recipe_that_finished_with_success
          render_inline(Admin::AppRecipes::LastRun::Component.new(app_recipe: app_recipes(:recipe_with_successful_run)))

          assert_selector("td[data-title]", text: "Successful run")
          assert_selector("td[data-time-passed]", text: "1 day ago")
          assert_selector("td[data-progression]", text: "SUCCESS")
          assert_selector("span[class*='bg-green-800 text-green-100']", text: "SUCCESS")
        end

        def test_render_app_recipe_that_finished_with_failure
          render_inline(Admin::AppRecipes::LastRun::Component.new(app_recipe: app_recipes(:recipe_with_failed_run)))

          assert_selector("td[data-title]", text: "Failed run")
          assert_selector("td[data-time-passed]", text: "1 day ago")
          assert_selector("td[data-progression]", text: "ERROR")
          assert_selector("span[class*='bg-red-800 text-red-100']", text: "ERROR")
        end
      end
    end
  end
end
