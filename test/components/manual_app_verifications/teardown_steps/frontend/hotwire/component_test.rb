require "view_component/test_case"

module ManualAppVerifications
  module TeardownSteps
    module Frontend
      module Hotwire
        class ComponentTest < ViewComponent::TestCase
          def test_component
            body = render_inline(ManualAppVerifications::TeardownSteps::Frontend::Hotwire::Component.new)

            assert_text "These are the teardown steps for Hotwire testing."
          end
        end
      end
    end
  end
end
