require 'application_system_test_case'

class CommandLineOutputTest < ApplicationSystemTestCase

  test 'Editing app name is reflected in command line output' do
    visit root_path

    fill_in 'app-name', with: 'edited_app_name'

    assert_selector(:xpath, "//p[@id='rails-new-output-text']",text: /rails new\s+edited_app_name/)
  end

  test 'Changing an item on every menu card is reflected in the command line output' do
    visit root_path

    choose_card_item html_id: 'database-choice-postgres'
    choose_card_item html_id: 'rails-flags-guest-favorites-spring'
    choose_card_item html_id: 'rails-flags-starters-keep'
    choose_card_item html_id: 'rails-flags-mains-activestorage'
    choose_card_item html_id: 'rails-flags-email-actionmailer'
    choose_card_item html_id: 'rails-flags-frontend-webpacker'
    choose_card_item html_id: 'rails-flags-testing-minitest'

    command_line_output = find(:xpath, "//p[@id='rails-new-output-text']").text

    assert_equal command_line_output.squish, 'rails new my_app -d postgresql --skip-action-mailer --skip-active-storage --skip-keeps --skip-spring --skip-test --skip-webpack-install'
  end

  private

  def choose_card_item(html_id:)
    find("##{html_id}").click
  end
end
