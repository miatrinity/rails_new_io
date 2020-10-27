module Main
  module AppNameInput
    class Component < ViewComponent::Base
      def initialize(app_name:)
        @app_name = app_name
      end
    end
  end
end
