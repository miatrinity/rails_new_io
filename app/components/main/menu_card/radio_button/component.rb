module Main
  module MenuCard
    module RadioButton
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
