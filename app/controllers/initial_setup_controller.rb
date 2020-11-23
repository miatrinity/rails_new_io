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
      testing: {
        Minitest: {
          'main-tab-testing-minitest': true
        },
        RSpec: {
          'main-tab-testing-minitest': false
        }
      },
      frontend: {
        none: {},
        Stimulus: {
          'main-tab-starters-gemfile': true,
          'main-tab-starters-bundle': true,
          'main-tab-frontend-javascript': true,
          'main-tab-frontend-webpacker': false,
          'main-tab-frontend-turbolinks': true,
          'main-tab-frontend-yarn': true
        },
        "Stimulus Reflex": {
          'main-tab-starters-gemfile': true,
          'main-tab-starters-bundle': true,
          'main-tab-mains-actioncable': true,
          'main-tab-frontend-javascript': true,
          'main-tab-frontend-webpacker': false,
          'main-tab-frontend-turbolinks': true,
          'main-tab-frontend-yarn': true
        }
      },
      css: {
        none: {},
        Tailwind: {
          'main-tab-starters-gemfile': true,
          'main-tab-starters-bundle': true,
          'main-tab-frontend-javascript': true,
          'main-tab-frontend-webpacker': false,
          'main-tab-frontend-turbolinks': true,
          'main-tab-frontend-yarn': true
        },
        Bootstrap: {
          'main-tab-starters-gemfile': true,
          'main-tab-starters-bundle': true,
          'main-tab-frontend-javascript': true,
          'main-tab-frontend-webpacker': false,
          'main-tab-frontend-turbolinks': true,
          'main-tab-frontend-yarn': true
        }
      }
    }
  end
end
