require "view_component/test_case"

module Pages
  module Why
    class ComponentTest < ViewComponent::TestCase
      def test_why_page
        render_inline(Pages::Why::Component.new)

        assert_text "Why?"
      end
    end
  end
end
