require 'view_component/test_case'

module Main
  module CommandLine
    module Output
      class ComponentTest < ViewComponent::TestCase
        def setup
          @global_state_translation = Rails.configuration.state_translation
          @global_initial_states = Rails.configuration.base_states
          
          @state_translation = {
            database_config: {
              database_choice: {
                DB1: { true => '', false => '' },
                DB2: { true => '-d db-option2', false => '' },
              }
            },
            rails_flags_config: {
              checkbox_items: {
                Checkbox1: { true => '', false => '--skip-checkbox-option1' },
                Checkbox2: { true => '', false => '--skip-checkbox-option2' }
              }
            }
          }

          @initial_state = {
            database_config: {
              database_choice: { DB1: true, DB2: nil }
            },
            ui_config: {
              base_setup: { state1: nil, state2: nil }
            },
            rails_flags_config: {
              checkbox_items: { Checkbox1: nil, Checkbox2: nil }
            }
          }
        end

        def test_initital_command_line_output
          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @state_translation,
            initial_state: @initial_state
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app')
        end

        def test_command_line_output_for_db1_and_checkbox1_selected
          @initial_state = {
            database_config: {
              database_choice: { DB1: true, DB2: false }
            },
            ui_config: {
              base_setup: { state1: nil, state2: nil }
            },            
            rails_flags_config: {
              checkbox_items: { Checkbox1: true, Checkbox2: false }
            }
          }

          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @state_translation,
            initial_state: @initial_state
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app --skip-checkbox-option2')
        end
        
        def test_command_line_output_for_db2_and_checkbox2_selected
          @initial_state = {
            database_config: {
              database_choice: { DB1: false, DB2: true }
            },
            ui_config: {
              base_setup: { state1: nil, state2: nil }
            },
            rails_flags_config: {
              checkbox_items: { Checkbox1: false, Checkbox2: true }
            }
          }

          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @state_translation,
            initial_state: @initial_state
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app -d db-option2 --skip-checkbox-option1')
        end
        
        def test_command_line_output_for_db2_and_all_checkboxes_selected
          @initial_state = {
            database_config: {
              database_choice: { DB1: false, DB2: true }
            },
            ui_config: {
              base_setup: { state1: nil, state2: nil }
            },            
            rails_flags_config: {
              checkbox_items: { Checkbox1: false, Checkbox2: false }
            }
          }

          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @state_translation,
            initial_state: @initial_state
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app -d db-option2')
        end

        # Testing real-life initial state command line outputs
        def test_omakase_command_line_output
          omakase_state = @global_initial_states[:omakase_state]

          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @global_state_translation,
            initial_state: omakase_state
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app')
        end

        def test_early_base_setup_command_line_output
          early_state = @global_initial_states[:early_state]

          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @global_state_translation,
            initial_state: early_state
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-text --skip-active-storage --skip-bootsnap --skip-javascript --skip-keeps --skip-listen --skip-spring --skip-system-test --skip-turbolinks --skip-webpack-install --skip-yarn')
        end

        def test_minimalist_base_setup_command_line_output
          minimalist_state = @global_initial_states[:minimalist_state]

          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @global_state_translation,
            initial_state: minimalist_state
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-bootsnap --skip-bundle --skip-gemfile --skip-git --skip-javascript --skip-keeps --skip-listen --skip-puma --skip-spring --skip-sprockets --skip-system-test --skip-test --skip-turbolinks --skip-webpack-install --skip-yarn')
        end

        def test_api_mode_base_setup_command_line_output
          api_state = @global_initial_states[:api_state]

          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @global_state_translation,
            initial_state: api_state
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app --api')
        end
      end
    end
  end
end
