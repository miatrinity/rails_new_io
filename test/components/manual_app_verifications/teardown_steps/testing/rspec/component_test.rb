require "view_component/test_case"

module ManualAppVerifications
  module TeardownSteps
    module Testing
      module Rspec
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::TeardownSteps::Testing::Rspec::Component.new)

            assert_text "(No teardown needed for RSpec)"
          end
        end
      end
    end
  end
end
