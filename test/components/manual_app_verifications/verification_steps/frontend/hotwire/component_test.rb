require "view_component/test_case"

module ManualAppVerifications
  module VerificationSteps
    module Frontend
      module Hotwire
        class ComponentTest < ViewComponent::TestCase
          def test_component
            render_inline(ManualAppVerifications::VerificationSteps::Frontend::Hotwire::Component.new)

            assert_text "These are the verification steps for Hotwire"
          end
        end
      end
    end
  end
end
