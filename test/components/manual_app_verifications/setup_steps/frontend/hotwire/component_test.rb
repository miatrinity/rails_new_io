require "view_component/test_case"

module ManualAppVerifications
  module SetupSteps
    module Frontend
      module Hotwire
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::SetupSteps::Frontend::Hotwire::Component.new)

            assert_text "These are the setup steps for Hotwire!"
          end
        end
      end
    end
  end
end
