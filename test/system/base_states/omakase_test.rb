require 'application_system_test_case'

class OmakaseTest < ApplicationSystemTestCase
 
  test 'Switching back to omakase state works correctly' do
    visit root_path

    find('#main-tab-base-setup-early').click
    find('#main-tab-base-setup-omakase').click

    ##########
    #
    # Main Tab
    #
    ##########

    # Time to Start Cooking Menu card
    assert page.find('#main-tab-base-setup-omakase').checked?
    refute page.find('#main-tab-base-setup-api').checked?
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

    assert_command_line_equals 'rails new my_app'
  end
end
