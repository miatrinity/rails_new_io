module Main
  module MenuCard
    module RadioButton
      class Component < ViewComponent::Base
        def initialize(menu_card_id:, title:, subtitle:, items:, initial_state:, state_translation:)
          @menu_card_id      = menu_card_id
          @title             = title
          @subtitle          = subtitle
          @items             = items
          @initial_state     = initial_state
          @state_translation = state_translation

          update_items
        end

        private

        def update_items
          @initial_state[@menu_card_id].each do |item_name, checked|
            item_to_update_for(item_name).merge!(
              {
                menu_card_id: @menu_card_id,
                command_output: command_output_for(item_name),
                checked: checked
              }
            )
          end
        end

        def item_to_update_for(item_name)
          @items.find { |item| item[:title] =~ /#{item_name}/i }
        end

        def command_output_for(item_name)
          @state_translation[@menu_card_id][item_name][true]
        end
      end
    end
  end
end
