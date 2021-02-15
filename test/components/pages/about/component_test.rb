require "view_component/test_case"

module Pages
  module About
    class ComponentTest < ViewComponent::TestCase
      def test_about_page
        render_inline(Pages::About::Component.new)

        assert_text "Behind the Scenes"
        assert_text "Get in Touch"
        assert_text "mia.trinity.codes@gmail.com"
        assert_text "@trinitytakei"
      end
    end
  end
end
