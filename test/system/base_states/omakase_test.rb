require 'application_system_test_case'

class OmakaseTest < ApplicationSystemTestCase
 
  test 'Starting with omakase initial state, tweaking setup then swithing initial state to early state works correctly' do
    visit root_path

    click_item_by html_id: 'main-tab-starters-keep'
    click_item_by html_id: 'main-tab-mains-activestorage'
    click_item_by html_id: 'main-tab-email-actionmailer'

    find('#main-tab-base-setup-early').click

    # Time to Start Cooking Menu card
    refute page.find('#main-tab-base-setup-omakase').checked?
    refute page.find('#main-tab-base-setup-api').checked?
    assert page.find('#main-tab-base-setup-early').checked?
    refute page.find('#main-tab-base-setup-minimalist').checked?

    # Our Database Menu Menu card
    assert page.find('#main-tab-database-choice-sqlite').checked?
    refute page.find('#main-tab-database-choice-postgres').checked?
    refute page.find('#main-tab-database-choice-mysql').checked?

    # Guest Favorites Menu card
    refute page.find('#main-tab-guest-favorites-spring').checked?
    refute page.find('#main-tab-guest-favorites-listen').checked?
    refute page.find('#main-tab-guest-favorites-bootsnap').checked?

    # Starters Menu card
    assert page.find('#main-tab-starters-gemfile').checked?
    assert page.find('#main-tab-starters-gitignore').checked?
    refute page.find('#main-tab-starters-keep').checked?
    assert page.find('#main-tab-starters-bundle').checked?
    assert page.find('#main-tab-starters-puma').checked?

    # Mains Menu card
    refute page.find('#main-tab-mains-actiontext').checked?
    assert page.find('#main-tab-mains-activerecord').checked?
    refute page.find('#main-tab-mains-activestorage').checked?
    refute page.find('#main-tab-mains-actioncable').checked?

    # Email me Maybe (#not) Menu card
    assert page.find('#main-tab-email-actionmailer').checked?
    refute page.find('#main-tab-email-actionmailbox').checked?

    # Le Frontend Menu card
    assert page.find('#main-tab-frontend-sprockets').checked?
    refute page.find('#main-tab-frontend-javascript').checked?
    refute page.find('#main-tab-frontend-turbolinks').checked?
    refute page.find('#main-tab-frontend-webpacker').checked?
    refute page.find('#main-tab-frontend-yarn').checked?

    # Testing Menu card
    assert page.find('#main-tab-testing-minitest').checked?
    refute page.find('#main-tab-testing-system').checked?

    command_line_output = find(:xpath, "//p[@id='rails-new-output-text']").text

    assert_equal command_line_output.squish, 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-text --skip-active-storage --skip-bootsnap --skip-javascript --skip-keeps --skip-listen --skip-spring --skip-system-test --skip-turbolinks --skip-webpack-install --skip-yarn'
  end
end
