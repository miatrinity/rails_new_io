require "view_component/test_case"

module ManualAppVerifications
  module VerificationSteps
    module Testing
      module None
        class ComponentTest < ViewComponent::TestCase
          def test_component
            body = render_inline(ManualAppVerifications::VerificationSteps::Testing::None::Component.new)

            assert_equal body.text, ""
          end
        end
      end
    end
  end
end
