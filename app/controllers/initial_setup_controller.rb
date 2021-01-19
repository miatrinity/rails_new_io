# frozen_string_literal: true

# nodoc
class InitialSetupController < ApplicationController
  def index
    @state_translation = Rails.configuration.state_translation
    @base_states = Rails.configuration.base_states
    @initial_state = Rails.configuration.initial_state
    @all_menu_cards_in_all_states = Rails.configuration.all_menu_cards_in_all_states
    @rails_bytes_combos = Rails.configuration.rails_bytes_combos
    @rails_bytes_locks = Rails.configuration.rails_bytes_locks
  end
end
