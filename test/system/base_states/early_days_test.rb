require 'application_system_test_case'

class EarlyDaysTest < ApplicationSystemTestCase
  include RailsNewIo::BaseStateItemsChecks::EarlyDays::MainTab
  include RailsNewIo::BaseStateItemsChecks::EarlyDays::ClassicsTab

  test '"The Early Days" radio button works correctly' do
    visit root_path

    find('#main-tab-base-setup-early').click

    refute_selector '#verify-my-setup-link', text: 'Verify My Setup'

    verify_early_days_main_tab_items_checked
    verify_early_days_main_tab_items_locked

    click_item_by html_id: 'classics-tab'
    verify_early_days_classics_tab_items_checked
    verify_early_days_classics_tab_items_active

    assert_command_line_equals 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-text --skip-active-storage --skip-bootsnap --skip-javascript --skip-keeps --skip-listen --skip-spring --skip-system-test --skip-turbolinks --skip-webpack-install --skip-yarn'
  end
end
