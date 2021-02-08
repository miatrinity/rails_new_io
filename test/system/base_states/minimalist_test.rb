require "application_system_test_case"

class MinimalistTest < ApplicationSystemTestCase
  include RailsNewIo::BaseStateItemsChecks::Minimalist::MainTab
  include RailsNewIo::BaseStateItemsChecks::Minimalist::ClassicsTab

  test '"The minimalist" radio button works correctly' do
    visit root_path

    find("#main-tab-base-setup-minimalist").click

    refute_selector "#verify-my-setup-link", text: "Verify My Setup"

    verify_minimalist_main_tab_items_checked
    verify_minimalist_main_tab_items_locked

    click_item_by html_id: "classics-tab"
    verify_minimalist_classics_tab_items_checked
    verify_minimalist_classics_tab_items_active

    assert_command_line_equals "rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-bootsnap --skip-bundle --skip-gemfile --skip-git --skip-javascript --skip-keeps --skip-listen --skip-puma --skip-spring --skip-sprockets --skip-system-test --skip-test --skip-turbolinks --skip-webpack-install --skip-yarn"
  end
end
