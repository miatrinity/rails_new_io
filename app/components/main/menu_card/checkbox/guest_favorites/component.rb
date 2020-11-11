module Main
  module MenuCard
    module Checkbox
      module GuestFavorites
        class Component < ViewComponent::Base
          def initialize(initial_states:, initial_state:, state_translation:)
            @initial_states    = initial_states
            @initial_state     = initial_state
            @state_translation = state_translation
          end
        end
      end
    end
  end
end
