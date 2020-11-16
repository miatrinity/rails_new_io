require 'application_system_test_case'

class APIModeTest < ApplicationSystemTestCase

  test 'Switching from "Omakase" to "API Mode" works correctly' do
    visit root_path

    click_item_by html_id: 'main-tab-base-setup-api'

    # Time to Start Cooking Menu card
    refute page.find('#main-tab-base-setup-omakase').checked?
    assert page.find('#main-tab-base-setup-api').checked?
    refute page.find('#main-tab-base-setup-early').checked?
    refute page.find('#main-tab-base-setup-minimalist').checked?

    # Our Database Menu Menu card
    assert page.find('#main-tab-database-choice-sqlite').checked?
    refute page.find('#main-tab-database-choice-postgres').checked?
    refute page.find('#main-tab-database-choice-mysql').checked?

    # Guest Favorites Menu card
    assert page.find('#main-tab-guest-favorites-spring').checked?
    assert page.find('#main-tab-guest-favorites-listen').checked?
    assert page.find('#main-tab-guest-favorites-bootsnap').checked?

    # Starters Menu card
    assert page.find('#main-tab-starters-gemfile').checked?
    assert page.find('#main-tab-starters-gitignore').checked?
    assert page.find('#main-tab-starters-keep').checked?
    assert page.find('#main-tab-starters-bundle').checked?
    assert page.find('#main-tab-starters-puma').checked?

    # Mains Menu card
    assert page.find('#main-tab-mains-actiontext').checked?
    assert page.find('#main-tab-mains-activerecord').checked?
    assert page.find('#main-tab-mains-activestorage').checked?
    assert page.find('#main-tab-mains-actioncable').checked?

    # Email me Maybe (#not) Menu card
    assert page.find('#main-tab-email-actionmailer').checked?
    assert page.find('#main-tab-email-actionmailbox').checked?

    # Le Frontend Menu card
    assert page.find('#main-tab-frontend-sprockets').checked?
    assert page.find('#main-tab-frontend-javascript').checked?
    assert page.find('#main-tab-frontend-turbolinks').checked?
    assert page.find('#main-tab-frontend-webpacker').checked?
    assert page.find('#main-tab-frontend-yarn').checked?

    # Testing Menu card
    assert page.find('#main-tab-testing-minitest').checked?
    assert page.find('#main-tab-testing-system').checked?

    command_line_output = find(:xpath, "//p[@id='rails-new-output-text']").text

    assert_equal command_line_output.squish, 'rails new my_app --api'
  end

  test 'Switching from "The Early Days" to "API Mode": --api flag should appear in the command line output' do
    visit root_path

    click_item_by html_id: 'main-tab-base-setup-early'
    click_item_by html_id: 'main-tab-base-setup-api'

    command_line_output = find(:xpath, "//p[@id='rails-new-output-text']").text

    assert_equal command_line_output.squish, 'rails new my_app --api'
  end

  test 'Switching from "API Mode" to "The Minimalist": --api flag should disappear from the command line output' do
    visit root_path

    click_item_by html_id: 'main-tab-base-setup-api'
    click_item_by html_id: 'main-tab-base-setup-minimalist'

    command_line_output = find(:xpath, "//p[@id='rails-new-output-text']").text

    assert_equal command_line_output.squish, 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-bootsnap --skip-bundle --skip-gemfile --skip-git --skip-javascript --skip-keeps --skip-listen --skip-puma --skip-spring --skip-sprockets --skip-system-test --skip-test --skip-turbolinks --skip-webpack-install --skip-yarn'
  end
end
