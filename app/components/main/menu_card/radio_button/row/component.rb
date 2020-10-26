module Main
  module MenuCard
    module RadioButton
      module Row
        class Component < ViewComponent::Base
          def initialize(title:, description:, command_output:)
            @title       = title
            @description = description
            @command_output = command_output
          end
        end
      end
    end
  end
end
