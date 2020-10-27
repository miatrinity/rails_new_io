module Main
  module MenuCard
    module Checkbox
      module Row
        class Component < ViewComponent::Base
          def initialize(title:, description:, command_output:, checked:)
            @title       = title
            @description = description
            @command_output = command_output
            @checked = checked
          end
        end
      end
    end
  end
end
