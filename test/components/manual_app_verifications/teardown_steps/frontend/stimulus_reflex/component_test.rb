require "view_component/test_case"

module ManualAppVerifications
  module TeardownSteps
    module Frontend
      module StimulusReflex
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::TeardownSteps::Frontend::StimulusReflex::Component.new)

            assert_text "> rm app/reflexes/counter_reflex.rb"
          end
        end
      end
    end
  end
end
