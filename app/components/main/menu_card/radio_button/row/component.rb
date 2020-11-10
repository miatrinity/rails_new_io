module Main
  module MenuCard
    module RadioButton
      module Row
        class Component < ViewComponent::Base
          def initialize(title:, has_image:false, description:, menu_card_id:, command_output:, checked:)
            @title = title
            @has_image = has_image
            @description = description
            @menu_card_id = menu_card_id
            @command_output = command_output
            @checked = checked
          end
        end
      end
    end
  end
end
