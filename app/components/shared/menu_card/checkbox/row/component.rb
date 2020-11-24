module Shared
  module MenuCard
    module Checkbox
      module Row
        class Component < ViewComponent::Base
          def initialize(title:, 
                         description:,
                         command_output:,
                         checked_attribute:,
                         display_locked_by_railsbytes:,
                         html_data_attributes:,
                         html_id:)

            @title                        = title
            @description                  = description
            @command_output               = command_output
            @checked_attribute            = checked_attribute
            @display_locked_by_railsbytes = display_locked_by_railsbytes
            @html_data_attributes         = html_data_attributes
            @html_id                      = html_id
          end
        end
      end
    end
  end
end
