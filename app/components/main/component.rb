module Main
  class Component < ViewComponent::Base
    def initialize(initial_state:, state_translation:, base_states:)
      @base_states = base_states
      @initial_state = initial_state
      @state_translation = state_translation
    end
  end
end
