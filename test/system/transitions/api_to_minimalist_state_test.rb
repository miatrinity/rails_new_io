require "application_system_test_case"

class EarlyToApiStateTest < ApplicationSystemTestCase
  test 'Switching from "API Mode" to "The Minimalist": --api flag should disappear from the command line output' do
    visit root_path

    click_item_by html_id: "main-tab-base-setup-api"
    click_item_by html_id: "main-tab-base-setup-minimalist"

    assert_command_line_equals "rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-bootsnap --skip-bundle --skip-gemfile --skip-git --skip-javascript --skip-keeps --skip-listen --skip-puma --skip-spring --skip-sprockets --skip-system-test --skip-test --skip-turbolinks --skip-webpack-install --skip-yarn"
  end
end
