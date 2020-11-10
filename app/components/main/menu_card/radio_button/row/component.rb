module Main
  module MenuCard
    module RadioButton
      module Row
        class Component < ViewComponent::Base
          def initialize(title:, has_image:false, description:, menu_card_id:, command_output:, checked:)
            @title          = title
            @has_image      = has_image
            @description    = description
            @menu_card_id   = menu_card_id
            @command_output = command_output
            @checked        = checked
            @html_id        = html_id
            @icon           = icon
          end

          private

          def icon
            return unless @has_image

            image_tag "#{@title}.svg"
          end

          def html_id
            @title.downcase.tr('^a-z 0-9', '').tr(' ','-')
          end
        end
      end
    end
  end
end
