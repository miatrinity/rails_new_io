require "view_component/test_case"

module Admin
  module AppRecipes
    module LastRun
      class ComponentTest < ViewComponent::TestCase
        def test_render_app_recipe_that_never_ran
          render_inline(Admin::AppRecipes::LastRun::Component.new(app_recipe: app_recipes(:never_ran)))

          assert_selector("td[data-title]", text: "I never ran")
          assert_selector("td[data-time-passed]", text: "No Runs - Yet!")
          assert_selector("td[data-status]", text: "")
        end
      end
    end
  end
end
