module Main
  module MenuCard
    module Checkbox
      module Row
        class Component < ViewComponent::Base
          def initialize(title:, description:, command_output:, checked:)
            @title          = title
            @description    = description
            @command_output = command_output
            @checked        = checked
            @html_id        = html_id
          end

          private

          def html_id
            @title.downcase.tr('^a-z 0-9', '').tr(' ','-')
          end
        end
      end
    end
  end
end
