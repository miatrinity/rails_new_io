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
                html_data_attributes: html_data_attributes_for(item_name),
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

        def html_data_attributes_for(item_name)
          HTMLDataAttributeGenerator.new(item_name, @initial_states, @menu_card_id).html_attributes
        end

        def html_id_for(item_name)
          "rails-flags-#{@menu_card_id}-#{item_name}".downcase.dasherize
        end
      end

      class HTMLDataAttributeGenerator
        def initialize(item_name, initial_states, menu_card_id)
          @item_name = item_name
          @initial_states = initial_states
          @menu_card_id = menu_card_id
        end

        def html_attributes
          @initial_states.keys.each_with_object([]) do |initial_state_name, html_data_attributes|
            html_data_attributes << html_data_attribute(initial_state_name)
          end.join(' ').html_safe
        end

        private

        def html_data_attribute(initial_state_name)
          attribute_code = <<-CODE
            #{attribute_name(initial_state_name)}="#{attribute_value(initial_state_name)}"
          CODE

          attribute_code.squish.tr(' ', '')
        end

        def attribute_name(initial_state_name)
          "data-#{initial_state_name}".dasherize
        end

        def attribute_value(initial_state_name)
          @initial_states[initial_state_name][:rails_flags][@menu_card_id][@item_name]
        end
      end
    end
  end
end
