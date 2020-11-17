module Shared
  module MenuCard
    module RadioButton
      class Component < ViewComponent::Base
        def initialize(
          menu_card_id:,
          title:,
          subtitle:,
          items:,
          menu_card_in_a_specific_state:,
          card_state_translation:,
          menu_card_in_all_states:,
          data_controller:,
          data_action:,
          data_target:
        )
          @menu_card_id                  = menu_card_id
          @title                         = title
          @subtitle                      = subtitle
          @items                         = items
          @menu_card_in_all_states       = menu_card_in_all_states
          @menu_card_in_a_specific_state = menu_card_in_a_specific_state
          @card_state_translation        = card_state_translation
          @data_controller               = data_controller
          @data_action                   = data_action
          @data_target                   = data_target

          update_items
        end

        private

        def update_items
          @menu_card_in_a_specific_state.each do |item_name, checked|
            item_to_update_for(item_name).merge!(
              {
                menu_card_id: @menu_card_id,
                command_output: command_output_for(item_name),
                checked: checked,
                html_data_attributes: html_data_attributes_for(item_name),
                html_id: html_id_for(item_name),
                data_controller: @data_controller,
                data_action: @data_action,
                data_target: @data_target
              }
            )
          end
        end

        def item_to_update_for(item_name)
          @items.find { |item| item[:title] =~ /#{item_name}/i }
        end

        def command_output_for(item_name)          
          @card_state_translation[item_name][true]
        end

        def html_data_attributes_for(item_name)
          RailsNewIo::HtmlDataAttributeGenerator.new(
            item_name,
            @menu_card_in_all_states,
            @menu_card_id
          ).html_data_attributes
        end

        def html_id_for(item_name)
          "#{@menu_card_id}-#{item_name}".tr(' ','-').downcase.dasherize
        end
      end
    end
  end
end
