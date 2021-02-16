require "view_component/test_case"

module ManualAppVerifications
  module SetupSteps
    module Frontend
      module Stimulus
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::SetupSteps::Frontend::Stimulus::Component.new)

            assert_text "hello.output"
          end
        end
      end
    end
  end
end
