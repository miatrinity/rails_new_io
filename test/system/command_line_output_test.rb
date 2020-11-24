require 'application_system_test_case'

class CommandLineOutputTest < ApplicationSystemTestCase

  test 'Editing app name is reflected in command line output' do
    visit root_path

    fill_in 'app-name', with: 'edited_app_name'

    assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: /rails new\s+edited_app_name/)
  end

  test 'Changing an item on every menu card is reflected in the command line output' do
    visit root_path

    click_item_by html_id: 'main-tab-database-choice-postgres'
    click_item_by html_id: 'main-tab-guest-favorites-spring'
    click_item_by html_id: 'main-tab-starters-keep'
    click_item_by html_id: 'main-tab-mains-activestorage'
    click_item_by html_id: 'main-tab-email-actionmailer'
    click_item_by html_id: 'main-tab-frontend-webpacker'
    click_item_by html_id: 'main-tab-testing-minitest'
    click_item_by html_id: 'classics-tab-frontend-stimulus-reflex'
    click_item_by html_id: 'classics-tab-testing-rspec'
    click_item_by html_id: 'classics-tab-css-bootstrap'

    assert_command_line_equals 'rails new my_app -d postgresql --skip-action-mailer --skip-active-storage --skip-keeps --skip-spring --skip-test --skip-webpack-install --template https://www.railsbytes.com/script/zyvso6'
  end

  test 'Choosing the RSpec railsbyte is reflected in the command line output' do
    visit root_path

    click_item_by html_id: 'classics-tab-testing-rspec'

    assert_command_line_equals 'rails new my_app --skip-test --template https://www.railsbytes.com/script/VD7sra'
  end
end
