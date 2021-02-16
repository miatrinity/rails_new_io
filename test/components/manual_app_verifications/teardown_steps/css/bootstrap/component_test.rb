require "view_component/test_case"

module ManualAppVerifications
  module TeardownSteps
    module Css
      module Bootstrap
        class ComponentTest < ViewComponent::TestCase
          def test_component
            body = render_inline(ManualAppVerifications::TeardownSteps::Css::Bootstrap::Component.new)

            assert_equal body.text, ""
          end
        end
      end
    end
  end
end
