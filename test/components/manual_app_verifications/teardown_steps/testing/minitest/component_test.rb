require "view_component/test_case"

module ManualAppVerifications
  module TeardownSteps
    module Testing
      module Minitest
        class ComponentTest < ViewComponent::TestCase
          def test_component
            body = render_inline(ManualAppVerifications::TeardownSteps::Testing::Minitest::Component.new)

            assert_equal body.text, ""
          end
        end
      end
    end
  end
end
