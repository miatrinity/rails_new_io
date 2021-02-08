require "application_system_test_case"

class APIModeTest < ApplicationSystemTestCase
  include RailsNewIo::BaseStateItemsChecks::ApiMode::MainTab
  include RailsNewIo::BaseStateItemsChecks::ApiMode::ClassicsTab

  test 'Switching from "Omakase" to "API Mode" works correctly' do
    visit root_path

    click_item_by html_id: "main-tab-base-setup-api"

    refute_selector "#verify-my-setup-link", text: "Verify My Setup"

    verify_api_mode_main_tab_items_checked
    verify_api_mode_main_tab_items_locked

    click_item_by html_id: "classics-tab"
    verify_api_mode_classics_tab_items_checked
    verify_api_mode_classics_tab_items_active

    assert_command_line_equals "rails new my_app --api"
  end
end
