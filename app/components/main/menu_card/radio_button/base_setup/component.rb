module Main
  module MenuCard
    module RadioButton
      module BaseSetup
        class Component < ViewComponent::Base
          def initialize(initial_card_state:, card_state_translation:)
            @initial_card_state = initial_card_state
            @card_state_translation = card_state_translation
          end
        end
      end
    end
  end
end
