require "view_component/test_case"

module ManualAppVerifications
  module VerificationSteps
    class ComponentTest < ViewComponent::TestCase
      def test_css_none_frontend_none_verification_code_is_hidden
        rails_bytes = %w[css-none frontend-none]

        body = render_inline(ManualAppVerifications::VerificationSteps::Component.new(rails_bytes: rails_bytes))

        assert_equal body.text.strip, ""
      end

      def test_when_css_present_extra_instructions_appear
        rails_bytes = %w[css-tailwind frontend-none]

        render_inline(ManualAppVerifications::VerificationSteps::Component.new(rails_bytes: rails_bytes))

        assert_text "> bin/webpack-dev-server"
      end

      def test_when_frontend_present_extra_instructions_appear
        rails_bytes = %w[css-none frontend-stimulus]

        render_inline(ManualAppVerifications::VerificationSteps::Component.new(rails_bytes: rails_bytes))

        assert_text "> bin/webpack-dev-server"
      end
    end
  end
end
