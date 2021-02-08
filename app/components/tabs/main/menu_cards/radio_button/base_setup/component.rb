module Tabs
  module Main
    module MenuCards
      module RadioButton
        module BaseSetup
          class Component < ViewComponent::Base
            def initialize(menu_card_in_all_states:, menu_card_in_a_specific_state:, card_state_translation:)
              @menu_card_in_all_states = menu_card_in_all_states
              @menu_card_in_a_specific_state = menu_card_in_a_specific_state
              @card_state_translation = card_state_translation
            end
          end
        end
      end
    end
  end
end
