require 'application_system_test_case'

class OmakaseTest < ApplicationSystemTestCase
  include RailsNewIo::BaseStateItemsChecks::Omakase::MainTab
  include RailsNewIo::BaseStateItemsChecks::Omakase::ClassicsTab

  test 'Switching back to omakase state works correctly' do
    visit root_path

    find('#main-tab-base-setup-early').click
    find('#main-tab-base-setup-omakase').click

    refute_selector '#verify-my-setup-link', text: 'Verify My Setup'

    verify_omakase_main_tab_items_checked
    verify_omakase_main_tab_items_locked

    click_item_by html_id: 'classics-tab'
    verify_omakase_classics_tab_items_checked
    verify_omakase_classics_tab_items_active

    assert_command_line_equals 'rails new my_app'
  end
end
