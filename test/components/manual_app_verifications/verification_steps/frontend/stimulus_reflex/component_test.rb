require "view_component/test_case"

module ManualAppVerifications
  module VerificationSteps
    module Frontend
      module StimulusReflex
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::VerificationSteps::Frontend::StimulusReflex::Component.new)

            assert_text 'The number should be incrementing when you click the "Click me to increment the number:" link'
          end
        end
      end
    end
  end
end
