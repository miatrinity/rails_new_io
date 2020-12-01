require 'view_component/test_case'

module CustomSetupVerifications
  class RealDataComponentTest < ViewComponent::TestCase
    def test_verification_instructions_for_selected_rails_bytes
      rails_bytes = %w[css-bootstrap frontend-stimulus-reflex testing-rspec]

      render_inline(CustomSetupVerifications::Component.new(rails_bytes: rails_bytes))

      assert_text '> rails g controller verify index'
      assert_text 'Hello, Bootstrap!'
      assert_text 'Click me to increment the number:'
      assert_text 'To verify Bootstrap:'
      assert_text 'To verify Stimulus Reflex:'
      assert_text 'To verify RSpec:'
    end

    def test_if_verifying_testing_rails_bytes_only_do_not_display_generate_controller_instructions
      rails_bytes = %w[css-none frontend-none testing-rspec]

      render_inline(CustomSetupVerifications::Component.new(rails_bytes: rails_bytes))

      refute_text '> rails g controller verify index'
    end

    def test_rails_byte_selection_is_formatted_correctly
      rails_bytes = %w[css-tailwind frontend-stimulus testing-minitest]

      render_inline(CustomSetupVerifications::Component.new(rails_bytes: rails_bytes))

      assert_selector('.font-semibold', text: 'Css:')
      assert_selector('.font-semibold', text: 'Tailwind')
      assert_selector('.font-semibold', text: 'Frontend:')
      assert_selector('.font-semibold', text: 'Stimulus')
      assert_selector('.font-extralight', text: 'Testing:')
      assert_selector('.font-extralight', text: 'Minitest')
    end
  end
end
