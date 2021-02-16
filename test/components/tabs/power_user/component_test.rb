require "view_component/test_case"

module Tabs
  module PowerUser
    class ComponentTest < ViewComponent::TestCase
      def test_component
        render_inline(Tabs::PowerUser::Component.new)

        assert_text "Here cometh the power user"
      end
    end
  end
end
