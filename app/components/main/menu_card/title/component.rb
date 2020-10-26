
module Main
  module MenuCard
    module Title
      class Component < ViewComponent::Base
        def initialize(title:)
          @title = title
        end
      end
    end
  end
end

