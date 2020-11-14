require 'application_system_test_case'

class OmakaseTest < ApplicationSystemTestCase
 
  test 'Starting with omakase initial state, tweaking setup then swithing initial state to early state works correctly' do
    visit root_path

    click_item_by html_id: 'rails-flags-starters-keep'
    click_item_by html_id: 'rails-flags-mains-activestorage'
    click_item_by html_id: 'rails-flags-email-actionmailer'

    find('#base-setup-early').click

    # Time to Start Cooking Menu card
    refute page.find('#base-setup-omakase').checked?
    refute page.find('#base-setup-api').checked?
    assert page.find('#base-setup-early').checked?
    refute page.find('#base-setup-minimalist').checked?

    # Our Database Menu Menu card
    assert page.find('#database-choice-sqlite').checked?
    refute page.find('#database-choice-postgres').checked?
    refute page.find('#database-choice-mysql').checked?

    # Guest Favorites Menu card
    refute page.find('#rails-flags-guest-favorites-spring').checked?
    refute page.find('#rails-flags-guest-favorites-listen').checked?
    refute page.find('#rails-flags-guest-favorites-bootsnap').checked?

    # Starters Menu card
    assert page.find('#rails-flags-starters-gemfile').checked?
    assert page.find('#rails-flags-starters-gitignore').checked?
    refute page.find('#rails-flags-starters-keep').checked?
    assert page.find('#rails-flags-starters-bundle').checked?
    assert page.find('#rails-flags-starters-puma').checked?

    # Mains Menu card
    refute page.find('#rails-flags-mains-actiontext').checked?
    assert page.find('#rails-flags-mains-activerecord').checked?
    refute page.find('#rails-flags-mains-activestorage').checked?
    refute page.find('#rails-flags-mains-actioncable').checked?

    # Email me Maybe (#not) Menu card
    assert page.find('#rails-flags-email-actionmailer').checked?
    refute page.find('#rails-flags-email-actionmailbox').checked?

    # Le Frontend Menu card
    assert page.find('#rails-flags-frontend-sprockets').checked?
    refute page.find('#rails-flags-frontend-javascript').checked?
    refute page.find('#rails-flags-frontend-turbolinks').checked?
    refute page.find('#rails-flags-frontend-webpacker').checked?
    refute page.find('#rails-flags-frontend-yarn').checked?

    # Testing Menu card
    assert page.find('#rails-flags-testing-minitest').checked?
    refute page.find('#rails-flags-testing-system').checked?

    command_line_output = find(:xpath, "//p[@id='rails-new-output-text']").text

    assert_equal command_line_output.squish, 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-text --skip-active-storage --skip-bootsnap --skip-javascript --skip-keeps --skip-listen --skip-spring --skip-system-test --skip-turbolinks --skip-webpack-install --skip-yarn'
  end
end
