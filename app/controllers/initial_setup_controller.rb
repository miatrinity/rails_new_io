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
  end
end
