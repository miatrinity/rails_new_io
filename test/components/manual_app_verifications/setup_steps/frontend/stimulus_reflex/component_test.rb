require "view_component/test_case"

module ManualAppVerifications
  module SetupSteps
    module Frontend
      module StimulusReflex
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::SetupSteps::Frontend::StimulusReflex::Component.new)

            assert_text "CounterReflex"
          end
        end
      end
    end
  end
end
