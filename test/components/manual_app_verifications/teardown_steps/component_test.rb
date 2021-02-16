require "view_component/test_case"

module ManualAppVerifications
  module TeardownSteps
    class ComponentTest < ViewComponent::TestCase
      def test_css_none_frontend_none_teardown_code_is_hidden
        rails_bytes = %w[css-none frontend-none]

        body = render_inline(ManualAppVerifications::TeardownSteps::Component.new(rails_bytes: rails_bytes))

        assert_equal body.text.strip, ""
      end

      def test_when_css_present_extra_instructions_appear
        rails_bytes = %w[css-tailwind frontend-none]

        render_inline(ManualAppVerifications::TeardownSteps::Component.new(rails_bytes: rails_bytes))

        assert_text "> rails d controller verify index"
      end

      def test_when_frontend_present_extra_instructions_appear
        rails_bytes = %w[css-none frontend-stimulus]

        render_inline(ManualAppVerifications::TeardownSteps::Component.new(rails_bytes: rails_bytes))

        assert_text "> rails d controller verify index"
      end
    end
  end
end
