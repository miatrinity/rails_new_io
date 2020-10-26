module Main
  module MenuCard
    module Checkbox
      class Component < ViewComponent::Base
        def initialize(title:, subtitle:, items:)
          @title      = title
          @subtitle   = subtitle
          @items      = items
        end
      end
    end
  end
end
