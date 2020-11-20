require 'application_system_test_case'

class EarlyToApiStateTest < ApplicationSystemTestCase
  test 'Switching from "The Early Days" to "API Mode": --api flag should appear in the command line output' do
    visit root_path

    click_item_by html_id: 'main-tab-base-setup-early'
    click_item_by html_id: 'main-tab-base-setup-api'

    assert_command_line_equals 'rails new my_app --api'
  end
end
