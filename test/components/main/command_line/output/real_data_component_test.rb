require 'view_component/test_case'

module Main
  module CommandLine
    module Output
      class RealDataComponentTest < ViewComponent::TestCase
        def setup
          @state_translation = Rails.configuration.state_translation
          @initial_states = Rails.configuration.base_states
          @rails_bytes_combos = Rails.configuration.rails_bytes_combos
        end

        # Testing real-life initial state command line outputs
        def test_omakase_command_line_output
          omakase_state = @initial_states[:omakase_state]

          render_inline(
            Shared::CommandLine::Output::Component.new(
              state_translation: @state_translation,
              initial_state: omakase_state,
              rails_bytes_combos: @rails_bytes_combos
            )
          )

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app')
        end

        def test_early_base_setup_command_line_output
          early_state = @initial_states[:early_state]

          render_inline(
            Shared::CommandLine::Output::Component.new(
              state_translation: @state_translation,
              initial_state: early_state,
              rails_bytes_combos: @rails_bytes_combos
            )
          )

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-text --skip-active-storage --skip-bootsnap --skip-javascript --skip-keeps --skip-listen --skip-spring --skip-system-test --skip-turbolinks --skip-webpack-install --skip-yarn')
        end

        def test_minimalist_base_setup_command_line_output
          minimalist_state = @initial_states[:minimalist_state]

          render_inline(
            Shared::CommandLine::Output::Component.new(
              state_translation: @state_translation,
              initial_state: minimalist_state,
              rails_bytes_combos: @rails_bytes_combos
            )
          )

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-bootsnap --skip-bundle --skip-gemfile --skip-git --skip-javascript --skip-keeps --skip-listen --skip-puma --skip-spring --skip-sprockets --skip-system-test --skip-test --skip-turbolinks --skip-webpack-install --skip-yarn')
        end

        def test_api_mode_base_setup_command_line_output
          api_state = @initial_states[:api_state]

          render_inline(
            Shared::CommandLine::Output::Component.new(
              state_translation: @state_translation,
              initial_state: api_state,
              rails_bytes_combos: @rails_bytes_combos
            )
          )

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app --api')
        end

        def test_css_bootstrap_frontend_none_testing_minitest_command_line_output
          @initial_states[:omakase_state][:classics_tab][:rails_bytes_config] = {
            testing: { Minitest: true, RSpec: false },
            css: { none: false, Tailwind: false, Bootstrap: true},
            frontend: { none: true, Stimulus: false, "Stimulus Reflex": false }
          }

          render_inline(
            Shared::CommandLine::Output::Component.new(
              state_translation: @state_translation,
              initial_state: @initial_states[:omakase_state],
              rails_bytes_combos: @rails_bytes_combos
            )
          )

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app --template https://www.railsbytes.com/script/VMys5p')
        end
      end
    end
  end
end
