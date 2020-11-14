require 'application_system_test_case'

class MinimalistTest < ApplicationSystemTestCase

  test '"The minimalist" radio button works correctly' do
    visit root_path

    find('#base-setup-minimalist').click
    
    # Time to Start Cooking Menu card
    refute page.find('#base-setup-omakase').checked?
    refute page.find('#base-setup-api').checked?
    refute page.find('#base-setup-early').checked?
    assert page.find('#base-setup-minimalist').checked?

    # Our Database Menu Menu card
    assert page.find('#database-choice-sqlite').checked?
    refute page.find('#database-choice-postgres').checked?
    refute page.find('#database-choice-mysql').checked?

    # Guest Favorites Menu card
    refute page.find('#rails-flags-guest-favorites-spring').checked?
    refute page.find('#rails-flags-guest-favorites-listen').checked?
    refute page.find('#rails-flags-guest-favorites-bootsnap').checked?

    # Starters Menu card
    refute page.find('#rails-flags-starters-gemfile').checked?
    refute page.find('#rails-flags-starters-gitignore').checked?
    refute page.find('#rails-flags-starters-keep').checked?
    refute page.find('#rails-flags-starters-bundle').checked?
    refute page.find('#rails-flags-starters-puma').checked?

    # Mains Menu card
    refute page.find('#rails-flags-mains-actiontext').checked?
    assert page.find('#rails-flags-mains-activerecord').checked?
    refute page.find('#rails-flags-mains-activestorage').checked?
    refute page.find('#rails-flags-mains-actioncable').checked?

    # Email me Maybe (#not) Menu card
    refute page.find('#rails-flags-email-actionmailer').checked?
    refute page.find('#rails-flags-email-actionmailbox').checked?

    # Le Frontend Menu card
    refute page.find('#rails-flags-frontend-sprockets').checked?
    refute page.find('#rails-flags-frontend-javascript').checked?
    refute page.find('#rails-flags-frontend-turbolinks').checked?
    refute page.find('#rails-flags-frontend-webpacker').checked?
    refute page.find('#rails-flags-frontend-yarn').checked?

    # Testing Menu card
    refute page.find('#rails-flags-testing-minitest').checked?
    refute page.find('#rails-flags-testing-system').checked?

    command_line_output = find(:xpath, "//p[@id='rails-new-output-text']").text

    assert_equal command_line_output.squish, 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-bootsnap --skip-bundle --skip-gemfile --skip-git --skip-javascript --skip-keeps --skip-listen --skip-puma --skip-spring --skip-sprockets --skip-system-test --skip-test --skip-turbolinks --skip-webpack-install --skip-yarn'
  end
end
