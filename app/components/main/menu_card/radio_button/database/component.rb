module Main
  module MenuCard
    module RadioButton
      module Database
        class Component < ViewComponent::Base
          def initialize(initial_card_state:, state_translation:)
            @initial_card_state = initial_card_state
            @state_translation = state_translation
          end
        end
      end
    end
  end
end
