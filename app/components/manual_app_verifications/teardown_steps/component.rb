module ManualAppVerifications
  module TeardownSteps
    class Component < ViewComponent::Base
      def initialize(rails_bytes:)
        @rails_bytes = rails_bytes
      end

      def teardown_code
        hide_teardown_code? ? "" : '<li><pre class="code">> rails d controller verify index</pre></li>'.html_safe
      end

      private

      def hide_teardown_code?
        @rails_bytes.include?("css-none") && @rails_bytes.include?("frontend-none")
      end
    end
  end
end
