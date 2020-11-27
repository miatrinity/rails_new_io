module CustomSetupVerifications
  module SetupSteps
    class Component < ViewComponent::Base
      def initialize(rails_bytes:)
        @rails_bytes = rails_bytes
      end

      def controller_generation_code
        display_controller_generation_code? ? '' : '<li><pre>> rails g controller verify index</pre></li>'.html_safe
      end

      private

      def display_controller_generation_code?
        @rails_bytes.include?('css-none') && @rails_bytes.include?('frontend-none')
      end
    end
  end
end
