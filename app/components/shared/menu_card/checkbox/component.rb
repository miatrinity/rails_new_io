module Shared
  module MenuCard
    module Checkbox
      class Component < ViewComponent::Base
        def initialize(menu_card_id:,
          title:,
          subtitle:,
          items:,
          menu_card_in_all_states:,
          menu_card_in_a_specific_state:,
          card_state_translation:)

          @menu_card_id = menu_card_id
          @title = title
          @subtitle = subtitle
          @items = items
          @menu_card_in_all_states = menu_card_in_all_states
          @menu_card_in_a_specific_state = menu_card_in_a_specific_state
          @card_state_translation = card_state_translation

          update_items
        end

        private

        def update_items
          @menu_card_in_a_specific_state.each do |item_name, display_state|
            item_to_update_for(item_name).merge!(
              {
                command_output: command_output_for(item_name),
                checked_attribute: checked_attribute_for(display_state),
                html_data_attributes: html_data_attributes_for(item_name),
                html_id: html_id_for(item_name),
                display_locked_by_rails_bytes: display_locked_by_rails_bytes_for(item_name)
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

        def html_data_attributes_for(item_name)
          RailsNewIo::HtmlDataAttributeGenerator.new(
            item_name,
            @menu_card_in_all_states,
            @menu_card_id
          ).html_data_attributes
        end

        def html_id_for(item_name)
          "#{@menu_card_id}-#{item_name}".downcase.dasherize
        end

        def display_locked_by_rails_bytes_for(item_name)
          locked?(item_name) ? "" : "hidden"
        end

        def locked?(item_name)
          @menu_card_in_a_specific_state[item_name][:locked]
        end

        def checked_attribute_for(display_state)
          display_state[:checked] ? "checked" : ""
        end
      end
    end
  end
end
