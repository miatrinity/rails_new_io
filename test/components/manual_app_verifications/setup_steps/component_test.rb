require "view_component/test_case"

module ManualAppVerifications
  module SetupSteps
    class ComponentTest < ViewComponent::TestCase
      def test_basic_instruction_appears
        rails_bytes = %w[random]

        render_inline(ManualAppVerifications::SetupSteps::Component.new(rails_bytes: rails_bytes))

        assert_text "cd into the generated app"
      end

      def test_css_none_frontend_none_extra_instructions_dont_appear
        rails_bytes = %w[css-none frontend-none]

        body = render_inline(ManualAppVerifications::SetupSteps::Component.new(rails_bytes: rails_bytes))

        assert_equal body.text.strip, "cd into the generated app"
      end

      def test_when_css_present_extra_instructions_appear
        rails_bytes = %w[css-tailwind frontend-none]

        render_inline(ManualAppVerifications::SetupSteps::Component.new(rails_bytes: rails_bytes))

        assert_text "> rails g controller verify index"
      end

      def test_when_frontend_present_extra_instructions_appear
        rails_bytes = %w[css-none frontend-stimulus]

        render_inline(ManualAppVerifications::SetupSteps::Component.new(rails_bytes: rails_bytes))

        assert_text "> rails g controller verify index"
      end
    end
  end
end
