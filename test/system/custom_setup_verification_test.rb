require 'application_system_test_case'

class CustomSetupVerificationTest < ApplicationSystemTestCase
  include RailsNewIo::CustomAsserts
  
  test 'Custom setup verification flow works correctly' do
    visit root_path

    click_item_by html_id: 'classics-tab'
    click_item_by html_id: 'classics-tab-frontend-stimulus-reflex'
    click_on 'Verify My Setup'

    assert_text 'Verify RailsByte setup for:'
  end

  test 'Back to my Setup button works correctly and setup state is persisted' do
    visit root_path

    click_item_by html_id: 'main-tab-database-choice-postgres'
    click_item_by html_id: 'main-tab-guest-favorites-spring'
    click_item_by html_id: 'main-tab-starters-bundle'
    click_item_by html_id: 'main-tab-mains-actioncable'
    click_item_by html_id: 'main-tab-email-actionmailbox'

    click_item_by html_id: 'classics-tab'
    click_item_by html_id: 'classics-tab-css-tailwind'

    click_on 'Verify My Setup'
    click_on_first_link_with_text '< Back to my Setup'

    assert_command_line_equals 'rails new my_app -d postgresql --skip-action-cable --skip-action-mailbox --skip-spring --template https://www.railsbytes.com/script/z5Os6O'
  end

  private

  def click_on_first_link_with_text(text)
    page.all(:xpath, "//a[contains(.,'#{text}')]")[0].click
  end
end
