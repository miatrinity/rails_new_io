require "view_component/test_case"

module ManualAppVerifications
  module VerificationSteps
    module Frontend
      module None
        class ComponentTest < ViewComponent::TestCase
          def test_component
            body = render_inline(ManualAppVerifications::VerificationSteps::Frontend::None::Component.new)

            assert_equal body.text, ""
          end
        end
      end
    end
  end
end
