require "application_system_test_case"

class CustomizedOmakaseStateTest < ApplicationSystemTestCase
  test "Starting with omakase initial state, tweaking setup then switching initial state to early state works correctly" do
    visit root_path

    click_item_by html_id: "main-tab-starters-keep"
    click_item_by html_id: "main-tab-mains-activestorage"
    click_item_by html_id: "main-tab-email-actionmailer"

    click_item_by html_id: "classics-tab"
    click_item_by html_id: "classics-tab-css-bootstrap"

    click_item_by html_id: "main-tab"
    find("#main-tab-base-setup-early").click

    # Time to Start Cooking Menu card
    refute page.find("#main-tab-base-setup-omakase").checked?
    refute page.find("#main-tab-base-setup-api").checked?
    assert page.find("#main-tab-base-setup-early").checked?
    refute page.find("#main-tab-base-setup-minimalist").checked?

    # Our Database Menu Menu card
    assert page.find("#main-tab-database-choice-sqlite").checked?
    refute page.find("#main-tab-database-choice-postgres").checked?
    refute page.find("#main-tab-database-choice-mysql").checked?

    # Guest Favorites Menu card
    refute page.find("#main-tab-guest-favorites-spring").checked?
    refute page.find("#main-tab-guest-favorites-listen").checked?
    refute page.find("#main-tab-guest-favorites-bootsnap").checked?

    # Starters Menu card
    assert page.find("#main-tab-starters-gemfile").checked?
    assert page.find("#main-tab-starters-gitignore").checked?
    refute page.find("#main-tab-starters-keep").checked?
    assert page.find("#main-tab-starters-bundle").checked?
    assert page.find("#main-tab-starters-puma").checked?

    # Mains Menu card
    refute page.find("#main-tab-mains-actiontext").checked?
    assert page.find("#main-tab-mains-activerecord").checked?
    refute page.find("#main-tab-mains-activestorage").checked?
    refute page.find("#main-tab-mains-actioncable").checked?

    # Email me Maybe (#not) Menu card
    assert page.find("#main-tab-email-actionmailer").checked?
    refute page.find("#main-tab-email-actionmailbox").checked?

    # Le Frontend Menu card
    assert page.find("#main-tab-frontend-sprockets").checked?
    refute page.find("#main-tab-frontend-javascript").checked?
    refute page.find("#main-tab-frontend-turbolinks").checked?
    refute page.find("#main-tab-frontend-webpacker").checked?
    refute page.find("#main-tab-frontend-yarn").checked?

    # Testing Menu card
    assert page.find("#main-tab-testing-minitest").checked?
    refute page.find("#main-tab-testing-system").checked?

    #################
    #
    # RailsByte Locks
    #
    #################
    # Guest Favorites Menu card
    assert_hidden "main-tab-guest-favorites-spring-rails-byte-lock"
    assert_hidden "main-tab-guest-favorites-listen-rails-byte-lock"
    assert_hidden "main-tab-guest-favorites-bootsnap-rails-byte-lock"

    # Starters Menu card
    assert_hidden "main-tab-starters-gemfile-rails-byte-lock"
    assert_hidden "main-tab-starters-gitignore-rails-byte-lock"
    assert_hidden "main-tab-starters-keep-rails-byte-lock"
    assert_hidden "main-tab-starters-bundle-rails-byte-lock"
    assert_hidden "main-tab-starters-puma-rails-byte-lock"

    # Mains Menu card
    assert_hidden "main-tab-mains-actiontext-rails-byte-lock"
    assert_hidden "main-tab-mains-activerecord-rails-byte-lock"
    assert_hidden "main-tab-mains-activestorage-rails-byte-lock"
    assert_hidden "main-tab-mains-actioncable-rails-byte-lock"

    # Email me Maybe (#not) Menu card
    assert_hidden "main-tab-email-actionmailer-rails-byte-lock"
    assert_hidden "main-tab-email-actionmailbox-rails-byte-lock"

    # Le Frontend Menu card
    assert_hidden "main-tab-frontend-sprockets-rails-byte-lock"
    assert_hidden "main-tab-frontend-javascript-rails-byte-lock"
    assert_hidden "main-tab-frontend-turbolinks-rails-byte-lock"
    assert_hidden "main-tab-frontend-webpacker-rails-byte-lock"
    assert_hidden "main-tab-frontend-yarn-rails-byte-lock"

    # Testing Menu card
    assert_visible "main-tab-testing-minitest-rails-byte-lock"
    assert_hidden "main-tab-testing-system-rails-byte-lock"

    ##############
    #
    # Classics Tab
    #
    ##############

    click_item_by html_id: "classics-tab"

    # Testing Framework Menu Card
    assert page.find("#classics-tab-testing-minitest").checked?
    refute page.find("#classics-tab-testing-rspec").checked?

    # Frontend Framework Menu Card
    assert page.find("#classics-tab-frontend-none").checked?
    refute page.find("#classics-tab-frontend-stimulus").checked?
    refute page.find("#classics-tab-frontend-stimulus-reflex").checked?

    # CSS Framework Menu Card

    assert page.find("#classics-tab-css-none").checked?
    refute page.find("#classics-tab-css-tailwind").checked?
    refute page.find("#classics-tab-css-bootstrap").checked?

    assert_command_line_equals "rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-text --skip-active-storage --skip-bootsnap --skip-javascript --skip-keeps --skip-listen --skip-spring --skip-system-test --skip-turbolinks --skip-webpack-install --skip-yarn"
  end
end
