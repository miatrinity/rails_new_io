require "view_component/test_case"

module ManualAppVerifications
  module SetupSteps
    module Css
      module Bootstrap
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::SetupSteps::Css::Bootstrap::Component.new)

            assert_text "Hello, Bootstrap!"
          end
        end
      end
    end
  end
end
