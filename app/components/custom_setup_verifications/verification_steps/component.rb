module CustomSetupVerifications
  module VerificationSteps
    class Component < ViewComponent::Base
      def initialize(rails_bytes:)
        @rails_bytes = rails_bytes
      end

      def visit_verification_page_code
        if hide_verification_page_code?
          ''
        else
          <<-CODE
          <li>
            <pre class="code">> bin/webpack-dev-server</pre>
          </li>
          <li>
            in a different console:<br>
            <pre class="code">> bin/rails s -p 4242</pre>            
          </li>
          <li>
            <pre class="code">> open http://localhost:4242/verify/index</pre>
            (or simply visit <a href="http://localhost:4242/verify/index" class="text-blue-600 underline">http://localhost:4242/verify/index</a> in your browser)
          </li>
          CODE
        end.html_safe
      end

      private

      def hide_verification_page_code?
        @rails_bytes.include?('css-none') && @rails_bytes.include?('frontend-none')
      end
    end
  end
end
