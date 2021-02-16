require "view_component/test_case"

module Tabs
  module Deployment
    class ComponentTest < ViewComponent::TestCase
      def test_component
        render_inline(Tabs::Deployment::Component.new)

        assert_text "Here cometh the Deployment"
      end
    end
  end
end
