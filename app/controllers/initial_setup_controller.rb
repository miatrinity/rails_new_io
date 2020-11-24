# frozen_string_literal: true

# nodoc
class InitialSetupController < ApplicationController
  def index
    # menu_card_in_all_states
    # all_menu_cards_in_all_states
    # menu_card_in_a_specific_state
    # all_menu_cards_in_a_specific_state

    # base state: all possible initial states
    # initial state: base state we are initially loading from the server
    @state_translation = Rails.configuration.state_translation
    @base_states = Rails.configuration.base_states
    @initial_state = Rails.configuration.initial_state
    @all_menu_cards_in_all_states = Rails.configuration.all_menu_cards_in_all_states
    @rails_bytes_combos = Rails.configuration.rails_bytes_combos

    @rails_bytes_locks = {
      # frontend
      'classics-tab-frontend-none': {},
      'classics-tab-frontend-stimulus': {
        'main-tab-starters-gemfile': true,
        'main-tab-starters-bundle': true,
        'main-tab-frontend-javascript': true,
        'main-tab-frontend-webpacker': false,
        'main-tab-frontend-turbolinks': true,
        'main-tab-frontend-yarn': true
      },
      'classics-tab-frontend-stimulus-reflex': {
        'main-tab-starters-gemfile': true,
        'main-tab-starters-bundle': true,
        'main-tab-mains-actioncable': true,
        'main-tab-frontend-javascript': true,
        'main-tab-frontend-webpacker': false,
        'main-tab-frontend-turbolinks': true,
        'main-tab-frontend-yarn': true
      },
      # testing
      'classics-tab-testing-none': {
        'main-tab-testing-minitest': false,
        'main-tab-testing-system': false
      },
      'classics-tab-testing-minitest': {
        'main-tab-testing-minitest': true
      },
      'classics-tab-testing-rspec': {
        'main-tab-testing-minitest': false
      },
      # css
      'classics-tab-css-none': {},
      'classics-tab-css-tailwind': {
        'main-tab-starters-gemfile': true,
        'main-tab-starters-bundle': true,
        'main-tab-frontend-javascript': true,
        'main-tab-frontend-webpacker': false,
        'main-tab-frontend-turbolinks': true,
        'main-tab-frontend-yarn': true
      },
      'classics-tab-css-bootstrap': {
        'main-tab-starters-gemfile': true,
        'main-tab-starters-bundle': true,
        'main-tab-frontend-javascript': true,
        'main-tab-frontend-webpacker': false,
        'main-tab-frontend-turbolinks': true,
        'main-tab-frontend-yarn': true
      }
    }
  end
end
