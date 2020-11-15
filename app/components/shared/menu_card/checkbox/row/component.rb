module Shared
  module MenuCard
    module Checkbox
      module Row
        class Component < ViewComponent::Base
          def initialize(title:, description:, command_output:, checked:, html_data_attributes:, html_id:)
            @title                = title
            @description          = description
            @command_output       = command_output
            @checked              = checked
            @html_data_attributes = html_data_attributes
            @html_id              = html_id
          end
        end
      end
    end
  end
end
