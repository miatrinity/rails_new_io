module Main
  module Navbar
    module Mobile
      class Component < ViewComponent::Base
        def initialize(items:)
          @items = items
        end
      end
    end
  end
end
