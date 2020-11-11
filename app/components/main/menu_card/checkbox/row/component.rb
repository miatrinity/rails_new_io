module Main
  module MenuCard
    module Checkbox
      module Row
        class Component < ViewComponent::Base
          def initialize(title:, description:, command_output:, checked:, initial_data_states:, html_id:)
            @title               = title
            @description         = description
            @command_output      = command_output
            @checked             = checked
            @initial_data_states = initial_data_states
            @html_id             = html_id
          end
        end
      end
    end
  end
end
