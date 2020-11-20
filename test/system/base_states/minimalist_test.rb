require 'application_system_test_case'

class MinimalistTest < ApplicationSystemTestCase

  test '"The minimalist" radio button works correctly' do
    visit root_path

    find('#main-tab-base-setup-minimalist').click
    
    # Time to Start Cooking Menu card
    refute page.find('#main-tab-base-setup-omakase').checked?
    refute page.find('#main-tab-base-setup-api').checked?
    refute page.find('#main-tab-base-setup-early').checked?
    assert page.find('#main-tab-base-setup-minimalist').checked?

    # Our Database Menu Menu card
    assert page.find('#main-tab-database-choice-sqlite').checked?
    refute page.find('#main-tab-database-choice-postgres').checked?
    refute page.find('#main-tab-database-choice-mysql').checked?

    # Guest Favorites Menu card
    refute page.find('#main-tab-guest-favorites-spring').checked?
    refute page.find('#main-tab-guest-favorites-listen').checked?
    refute page.find('#main-tab-guest-favorites-bootsnap').checked?

    # Starters Menu card
    refute page.find('#main-tab-starters-gemfile').checked?
    refute page.find('#main-tab-starters-gitignore').checked?
    refute page.find('#main-tab-starters-keep').checked?
    refute page.find('#main-tab-starters-bundle').checked?
    refute page.find('#main-tab-starters-puma').checked?

    # Mains Menu card
    refute page.find('#main-tab-mains-actiontext').checked?
    assert page.find('#main-tab-mains-activerecord').checked?
    refute page.find('#main-tab-mains-activestorage').checked?
    refute page.find('#main-tab-mains-actioncable').checked?

    # Email me Maybe (#not) Menu card
    refute page.find('#main-tab-email-actionmailer').checked?
    refute page.find('#main-tab-email-actionmailbox').checked?

    # Le Frontend Menu card
    refute page.find('#main-tab-frontend-sprockets').checked?
    refute page.find('#main-tab-frontend-javascript').checked?
    refute page.find('#main-tab-frontend-turbolinks').checked?
    refute page.find('#main-tab-frontend-webpacker').checked?
    refute page.find('#main-tab-frontend-yarn').checked?

    # Testing Menu card
    refute page.find('#main-tab-testing-minitest').checked?
    refute page.find('#main-tab-testing-system').checked?

    ##############
    #
    # Classics Tab
    #
    ##############

    # Testing Framework Menu Card
    assert page.find('#classics-tab-testing-minitest').checked?
    refute page.find('#classics-tab-testing-rspec').checked?

    # Frontend Framework Menu Card
    assert page.find('#classics-tab-frontend-none').checked?
    refute page.find('#classics-tab-frontend-stimulus').checked?
    refute page.find('#classics-tab-frontend-stimulus-reflex').checked?

    # CSS Framework Menu Card

    assert page.find('#classics-tab-css-none').checked?
    refute page.find('#classics-tab-css-tailwind').checked?
    refute page.find('#classics-tab-css-bootstrap').checked?

    assert_command_line_equals 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-bootsnap --skip-bundle --skip-gemfile --skip-git --skip-javascript --skip-keeps --skip-listen --skip-puma --skip-spring --skip-sprockets --skip-system-test --skip-test --skip-turbolinks --skip-webpack-install --skip-yarn'
  end
end
