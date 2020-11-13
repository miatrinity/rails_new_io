module Main
  class Component < ViewComponent::Base
    def initialize(initial_state:, state_translation:, all_menu_cards_in_all_states:)
      @all_menu_cards_in_all_states = all_menu_cards_in_all_states
      @initial_state                = initial_state
      @state_translation            = state_translation
    end
  end
end