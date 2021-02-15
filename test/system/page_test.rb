require "application_system_test_case"

class PageTest < ApplicationSystemTestCase
  test "Visiting About/Contact Page" do
    visit page_path(:about)

    assert_text "Behind the Scenes"
  end
end
