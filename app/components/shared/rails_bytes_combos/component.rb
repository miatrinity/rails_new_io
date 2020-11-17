module Shared
  module RailsBytesCombos
    class Component < ViewComponent::Base
      def initialize(rails_bytes_combos:)
        @rails_bytes_combos = rails_bytes_combos
      end
    end
  end
end