require "view_component/test_case"

module ManualAppVerifications
  module VerificationSteps
    module Frontend
      module Stimulus
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::VerificationSteps::Frontend::Stimulus::Component.new)

            assert_text "the index page should display 'Hello, Stimulus!'"
          end
        end
      end
    end
  end
end
