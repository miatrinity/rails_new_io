module ManualAppVerifications
  module SetupSteps
    class Component < ViewComponent::Base
      def initialize(rails_bytes:)
        @rails_bytes = rails_bytes
      end

      def controller_generation_code
        hide_controller_generation_code? ? "" : '<li><pre class="code">> rails g controller verify index</pre></li>'.html_safe
      end

      private

      def hide_controller_generation_code?
        @rails_bytes.include?("css-none") && @rails_bytes.include?("frontend-none")
      end
    end
  end
end
