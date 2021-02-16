require "view_component/test_case"

module ManualAppVerifications
  module TeardownSteps
    module Frontend
      module Stimulus
        class ComponentTest < ViewComponent::TestCase
          def test_component
            body = render_inline(ManualAppVerifications::TeardownSteps::Frontend::Stimulus::Component.new)

            assert_equal body.text, ""
          end
        end
      end
    end
  end
end
