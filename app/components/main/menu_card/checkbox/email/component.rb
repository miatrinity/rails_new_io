module Main
  module MenuCard
    module Checkbox
      module Email
        class Component < ViewComponent::Base
          def initialize(initial_states:, initial_card_state:, card_state_translation:)
            @initial_states         = initial_states
            @initial_card_state     = initial_card_state
            @card_state_translation = card_state_translation
          end
        end
      end
    end
  end
end
