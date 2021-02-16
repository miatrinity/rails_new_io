require "view_component/test_case"

module ManualAppVerifications
  module SetupSteps
    module Css
      module Tailwind
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::SetupSteps::Css::Tailwind::Component.new)

            assert_text "Hello, Tailwind!"
          end
        end
      end
    end
  end
end
