require "view_component/test_case"

module ManualAppVerifications
  module VerificationSteps
    module Testing
      module Rspec
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::VerificationSteps::Testing::Rspec::Component.new)

            assert_text "RSpec is working as intended!"
          end
        end
      end
    end
  end
end
