require "view_component/test_case"

module ManualAppVerifications
  module VerificationSteps
    module Css
      module Bootstrap
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::VerificationSteps::Css::Bootstrap::Component.new)

            assert_text "the index page should display 'Hello, Bootstrap!' rendered in red"
          end
        end
      end
    end
  end
end
