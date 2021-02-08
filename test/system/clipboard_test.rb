require "application_system_test_case"

class ClipboardTest < ApplicationSystemTestCase
  test '"Copy to Clipboard" button works correctly' do
    visit root_path

    find(:xpath, "//a[contains(.,'📋️ Copy to Clipboard')]").click

    # paste clipboard content into the app-name input field
    # shift+insert works both on OS X and Linux for pasting
    find(:xpath, "//input[@name='app-name']").send_keys %i[shift insert]

    input_field_value = find(:xpath, "//input[@name='app-name']").value

    assert_equal input_field_value, "rails new my_app"
  end
end
