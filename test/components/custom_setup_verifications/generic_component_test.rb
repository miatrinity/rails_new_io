require 'view_component/test_case'

module CustomSetupVerifications
  module SetupSteps
    module Config1
      module RailsByte1
        class Component < ViewComponent::Base
          def call
            "Setup Step for Config1::Railsbyte1"
          end
        end
      end
    end
  end
end

module CustomSetupVerifications
  module VerificationSteps
    module Config1
      module RailsByte1
        class Component < ViewComponent::Base
          def call
            "Verification Step for Config1::Railsbyte1"
          end
        end
      end
    end
  end
end

module CustomSetupVerifications
  module SetupSteps
    module Config2
      module RailsByte3
        class Component < ViewComponent::Base
          def call
            "Setup Step for Config2::Railsbyte3"
          end
        end
      end
    end
  end
end

module CustomSetupVerifications
  module VerificationSteps
    module Config2
      module RailsByte3
        class Component < ViewComponent::Base
          def call
            "Verification Step for Config2::Railsbyte3"
          end
        end
      end
    end
  end
end

module CustomSetupVerifications
  class GenericComponentTest < ViewComponent::TestCase
    def setup
      @rails_bytes = [
        'config1-rails-byte1', 'config2-rails-byte3'
      ]
    end

    def test_back_to_my_setup_button_is_present_and_works_correctly
      puts render_inline(CustomSetupVerifications::Component.new(rails_bytes: @rails_bytes))

      assert_selector("a[href='javascript:history.back()']", text: '< Back to my Setup', count: 2)
    end
  end
end
