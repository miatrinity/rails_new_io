require 'application_system_test_case'

class HomepageTest < ApplicationSystemTestCase
  test 'Visiting Homepage' do
    visit root_path

    assert_selector 'h2', text: "Rails is\nomakase 🔪🍱"
  end

  test 'Editing app name is reflected in command line output' do
    visit root_path

    fill_in 'app-name', with: 'edited_app_name'

    assert_selector(:xpath, "//p[@id='rails-new-output-text']",text: /rails new\s+edited_app_name/)
  end

  test 'Changing an item on every menu card is reflected in the command line output' do
    visit root_path

    choose_card_item html_id: 'database-choice-Postgres'
    choose_card_item html_id: 'rails-flags-guest-favorites-spring'
    choose_card_item html_id: 'rails-flags-starters-keep'
    choose_card_item html_id: 'rails-flags-mains-activeStorage'
    choose_card_item html_id: 'rails-flags-email-actionMailer'
    choose_card_item html_id: 'rails-flags-frontend-webpacker'
    choose_card_item html_id: 'rails-flags-testing-minitest'

    command_line_output = find(:xpath, "//p[@id='rails-new-output-text']").text

    assert_equal command_line_output.squish, 'rails new my_app -d postgresql --skip-action-mailer --skip-active-storage --skip-keeps --skip-spring --skip-test --skip-webpack-install'
  end

  test '"Copy to Clipboard" button works correctly' do
    visit root_path

    click_on 'Copy to Clipboard'

    # paste clipboard content into the app-name input field
    # shift+insert works both on OS X and Linux for pasting
    find(:xpath, "//input[@name='app-name']").send_keys %i[shift insert]

    input_field_value = find(:xpath, "//input[@name='app-name']").value

    assert_equal input_field_value, 'rails new my_app'
  end

  test '"The Early Days" radio button works correctly' do
    visit root_path

    find('#base-setup-early').click
    
    # Time to Start Cooking Menu card
    refute page.find('#base-setup-omakase').checked?
    refute page.find('#base-setup-api').checked?
    assert page.find('#base-setup-early').checked?
    refute page.find('#base-setup-minimalist').checked?

    # Our Database Menu Menu card
    assert page.find('#database-choice-SQLite').checked?
    refute page.find('#database-choice-Postgres').checked?
    refute page.find('#database-choice-MySQL').checked?

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
    refute page.find('#rails-flags-mains-actionText').checked?
    assert page.find('#rails-flags-mains-activeRecord').checked?
    refute page.find('#rails-flags-mains-activeStorage').checked?
    refute page.find('#rails-flags-mains-actionCable').checked?

    # Email me Maybe (#not) Menu card
    assert page.find('#rails-flags-email-actionMailer').checked?
    refute page.find('#rails-flags-email-actionMailbox').checked?

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
  test 'Starting with omakase initial state, tweaking setup then swithing initial state to early state works correctly' do
    visit root_path
    
    # choose_card_item html_id: 'database-choice-Postgres'    
    choose_card_item html_id: 'rails-flags-starters-keep'
    choose_card_item html_id: 'rails-flags-mains-activeStorage'
    choose_card_item html_id: 'rails-flags-email-actionMailer'

    find('#base-setup-early').click
    
    # Time to Start Cooking Menu card
    refute page.find('#base-setup-omakase').checked?
    refute page.find('#base-setup-api').checked?
    assert page.find('#base-setup-early').checked?
    refute page.find('#base-setup-minimalist').checked?

    # Our Database Menu Menu card
    assert page.find('#database-choice-SQLite').checked?
    refute page.find('#database-choice-Postgres').checked?
    refute page.find('#database-choice-MySQL').checked?

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
    refute page.find('#rails-flags-mains-actionText').checked?
    assert page.find('#rails-flags-mains-activeRecord').checked?
    refute page.find('#rails-flags-mains-activeStorage').checked?
    refute page.find('#rails-flags-mains-actionCable').checked?

    # Email me Maybe (#not) Menu card
    assert page.find('#rails-flags-email-actionMailer').checked?
    refute page.find('#rails-flags-email-actionMailbox').checked?

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

  private

  def choose_card_item(html_id:)
    find("##{html_id}").click
  end
end
