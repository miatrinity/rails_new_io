module Main
  module MenuCard
    module Checkbox
      module Testing
        class Component < ViewComponent::Base
          def initialize(base_states:, menu_card_in_a_specific_state:, card_state_translation:)
            @base_states                   = base_states
            @menu_card_in_a_specific_state = menu_card_in_a_specific_state
            @card_state_translation        = card_state_translation
          end
        end
      end
    end
  end
end
