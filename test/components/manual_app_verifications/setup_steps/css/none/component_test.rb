require "view_component/test_case"

module ManualAppVerifications
  module SetupSteps
    module Css
      module None
        class ComponentTest < ViewComponent::TestCase
          def test_component
            body = render_inline(ManualAppVerifications::SetupSteps::Css::None::Component.new)

            assert_equal body.text, ""
          end
        end
      end
    end
  end
end
