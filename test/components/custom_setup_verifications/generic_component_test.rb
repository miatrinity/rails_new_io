require 'view_component/test_case'

module CustomSetupVerifications
  module SetupSteps
    module Config1
      module RailsByte1
        class Component < ViewComponent::Base
          def call
            'Setup Step for Config1::Railsbyte1'
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
            'Verification Step for Config1::Railsbyte1'
          end
        end
      end
    end
  end
end

module CustomSetupVerifications
  module TeardownSteps
    module Config1
      module RailsByte1
        class Component < ViewComponent::Base
          def call
            'Teardown Step for Config1::Railsbyte1'
          end
        end
      end
    end
  end
end

module CustomSetupVerifications
  module SetupSteps
    module Config1
      module None
        class Component < ViewComponent::Base
          def call
            ''
          end
        end
      end
    end
  end
end

module CustomSetupVerifications
  module VerificationSteps
    module Config1
      module None
        class Component < ViewComponent::Base
          def call
            ''
          end
        end
      end
    end
  end
end

module CustomSetupVerifications
  module TeardownSteps
    module Config1
      module None
        class Component < ViewComponent::Base
          def call
            ''
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
            'Setup Step for Config2::Railsbyte3'
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
            'Verification Step for Config2::Railsbyte3'
          end
        end
      end
    end
  end
end

module CustomSetupVerifications
  module TeardownSteps
    module Config2
      module RailsByte3
        class Component < ViewComponent::Base
          def call
            'Teardown Step for Config2::Railsbyte3'
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

      @rails_bytes_with_none = [
        'config1-none', 'config2-rails-byte3'
      ]
    end

    def test_base_text_elements_are_present_on_the_page
      render_inline(CustomSetupVerifications::Component.new(rails_bytes: @rails_bytes))

      assert_text 'Verify RailsByte setup for:'
      assert_text 'cd into the generated app'
    end

    def test_back_to_my_setup_button_is_present_and_works_correctly
      render_inline(CustomSetupVerifications::Component.new(rails_bytes: @rails_bytes))

      assert_selector("a[href='javascript:history.back()']", text: '< Back to my Setup', count: 2)
    end

    def test_verification_message_is_present_on_for_selected_rails_bytes
      render_inline(CustomSetupVerifications::Component.new(rails_bytes: @rails_bytes))

      assert_text 'Setup Step for Config1::Railsbyte1'
      assert_text 'Setup Step for Config2::Railsbyte3'
      assert_text 'Verification Step for Config1::Railsbyte1'
      assert_text 'Verification Step for Config2::Railsbyte3'
      assert_text 'Teardown Step for Config1::Railsbyte1'
      assert_text 'Teardown Step for Config2::Railsbyte3'
    end

    def test_rails_byte_selection_is_formatted_correctly
      render_inline(CustomSetupVerifications::Component.new(rails_bytes: @rails_bytes_with_none))

      assert_selector('.font-extralight', text: 'Config1:')
      assert_selector('.font-extralight', text: 'None')
      assert_selector('.font-semibold', text: 'Config2')
      assert_selector('.font-semibold', text: 'Rails Byte3')
    end
  end
end
