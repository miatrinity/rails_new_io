module Shared
  module BaseStates
    class Component < ViewComponent::Base
      def initialize(base_states:)
        @base_states = base_states
      end
    end
  end
end
