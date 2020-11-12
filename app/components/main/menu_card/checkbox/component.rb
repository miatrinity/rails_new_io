module Main
  module MenuCard
    module Checkbox
      class Component < ViewComponent::Base
        def initialize(menu_card_id:, title:, subtitle:, items:, initial_states:, initial_card_state:, card_state_translation:)
          @menu_card_id           = menu_card_id
          @title                  = title
          @subtitle               = subtitle
          @items                  = items
          @initial_states         = initial_states
          @initial_card_state     = initial_card_state
          @card_state_translation = card_state_translation

          update_items
        end

        private

        def update_items
          @initial_card_state.each do |item_name, checked|
            item_to_update_for(item_name).merge!(
              {
                command_output: command_output_for(item_name),
                checked: checked,
                initial_data_states: initial_data_states_for(item_name),
                html_id: html_id_for(item_name)
              }
            )
          end
        end

        def item_to_update_for(item_name)
          @items.find { |item| item[:title] =~ /#{item_name}/i }
        end

        def command_output_for(item_name)
          @card_state_translation[item_name][false]
        end

        def initial_data_states_for(item_name)
          initial_data_states = []
          @initial_states.keys.each do |initial_state_name|
            attribute_name = "data-base-setup-#{initial_state_name}".dasherize
            attribute_value = @initial_states[initial_state_name][:rails_flags][@menu_card_id][item_name]
            initial_data_states << "#{attribute_name}=\"#{attribute_value}\""
          end 
          initial_data_states.join(' ').html_safe
        end

        def html_id_for(item_name)
          "rails-flags-#{@menu_card_id}-#{item_name}".dasherize
        end
      end
    end
  end
end
