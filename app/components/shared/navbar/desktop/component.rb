module Shared
  module Navbar
    module Desktop
      class Component < ViewComponent::Base
        def initialize(items:)
          @items = items
        end

        def sitcky_or_not(controller_name)
          return '' unless controller_name == 'pages'

          'sticky top-0'
        end
      end
    end
  end
end
