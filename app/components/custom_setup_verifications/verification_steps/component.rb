module CustomSetupVerifications
  module VerificationSteps
    class Component < ViewComponent::Base
      def initialize(rails_bytes:)
        @rails_bytes = rails_bytes
      end
    end
  end
end
