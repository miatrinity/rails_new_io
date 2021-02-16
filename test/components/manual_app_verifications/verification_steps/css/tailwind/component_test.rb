require "view_component/test_case"

module ManualAppVerifications
  module VerificationSteps
    module Css
      module Tailwind
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::VerificationSteps::Css::Tailwind::Component.new)

            assert_text "page should contain 'Hello, Tailwind!' rendered in red"
          end
        end
      end
    end
  end
end
