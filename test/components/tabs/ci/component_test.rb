require "view_component/test_case"

module Tabs
  module Ci
    class ComponentTest < ViewComponent::TestCase
      def test_component
        render_inline(Tabs::Ci::Component.new)

        assert_text "Here cometh the CI/CD"
      end
    end
  end
end
