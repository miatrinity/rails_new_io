module Main
  module MenuCard
    module RadioButton
      class Component < ViewComponent::Base
        def initialize(title:, subtitle:, items:, initial_state:, state_translation:)
          @title      = title
          @subtitle   = subtitle
          @items      = items
          @initial_state = initial_state
          @state_translation = state_translation

          update_items
        end

        private

        def update_items
          @initial_state[:database_choice].each do |db_name, checked|
            command_output = @state_translation[:database_choice][db_name][true]

            item_to_update = @items.find{ |item| item[:title] == db_name.to_s }

            item_to_update.merge!({
              command_output: command_output,
              checked: checked
            })
          end
        end
      end
    end
  end
end
