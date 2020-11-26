module Shared
  module RailsBytesLocks
    class Component < ViewComponent::Base
      def initialize(rails_bytes_locks:)
        @rails_bytes_locks = rails_bytes_locks
      end
    end
  end
end
