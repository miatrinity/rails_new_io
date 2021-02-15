require "view_component/test_case"

module Pages
  module LiveDemo
    class ComponentTest < ViewComponent::TestCase
      def test_live_demo_page
        render_inline(Pages::LiveDemo::Component.new)

        assert_text "Table of Contents"
        assert_selector("a[href='#demo-1']", text: "Minimal")
        assert_selector("a[href='#demo-2']", text: "Minimal+Tweaks")
        assert_selector("a[href='#demo-3']", text: "Omakase+Tweaks")
        assert_selector("a[href='#demo-4']", text: "Minimal+Stimulus")
        assert_selector("a[href='#demo-5']", text: "Verify!")
      end
    end
  end
end
