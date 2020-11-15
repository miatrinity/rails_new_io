module Shared
  module Navbar
    module Desktop
      class Component < ViewComponent::Base
        def initialize(items:)
          @items = items
        end
      end
    end
  end
end
