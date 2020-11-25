module Shared
  module MenuCard
    module RadioButton
      module Row
        class Component < ViewComponent::Base
          def initialize(
            title:,
            has_image:false,
            description:,
            menu_card_id:,
            command_output:,
            checked:,
            html_id:,
            html_data_attributes:,
            data_controller:,
            data_action:,
            data_target:,
            data_active_rails_byte:
          )
            @title                  = title
            @has_image              = has_image
            @description            = description
            @menu_card_id           = menu_card_id
            @command_output         = command_output
            @checked                = checked
            @html_id                = html_id
            @icon                   = icon
            @html_data_attributes   = html_data_attributes
            @data_controller        = data_controller
            @data_action            = data_action
            @data_target            = data_target
            @data_active_rails_byte = data_active_rails_byte
          end

          private

          def icon
            return unless @has_image

            image_tag "#{@title}.svg"
          end
        end
      end
    end
  end
end
