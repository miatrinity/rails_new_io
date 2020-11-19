require 'view_component/test_case'

module Main
  module CommandLine
    module Output
      class GenericComponentTest < ViewComponent::TestCase
        def setup
          @state_translation = {
            main_tab: {
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
            },
            classics_tab: {
              rails_bytes_config: {
                rails_byte_radio_button_menu_card1: {
                  rails_byte1: { true => '', false => '' },
                  rails_byte2: { true => '', false => '' }
                },
                rails_byte_radio_button_menu_card2: {
                  rails_byte3: { true => '', false => '' },
                  rails_byte4: { true => '', false => '' }
                }
              }
            }
          }

          @initial_state = {
            main_tab: {
              database_config: {
                database_choice: { DB1: true, DB2: nil }
              },
              ui_config: {
                base_setup: { state1: nil, state2: nil }
              },
              rails_flags_config: {
                checkbox_items: { Checkbox1: nil, Checkbox2: nil }
              }
            },
            classics_tab: {
              rails_bytes_config: {
                rails_byte_radio_button_menu_card1: { rails_byte1: true, rails_byte2: false },
                rails_byte_radio_button_menu_card2: { rails_byte3: true, rails_byte4: false }
              }
            }
          }

          @rails_bytes_combos = {
            rails_bytes_combo1: 'url1',
            rails_bytes_combo2: 'url2'
          }
        end

        def test_initital_command_line_output
          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @state_translation,
            initial_state: @initial_state,
            rails_bytes_combos: @rails_bytes_combos
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app')
        end

        def test_command_line_output_for_db1_and_checkbox1_selected
          @initial_state[:main_tab] = {
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
            initial_state: @initial_state,
            rails_bytes_combos: @rails_bytes_combos
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app --skip-checkbox-option2')
        end

        def test_command_line_output_for_db2_and_checkbox2_selected
          @initial_state[:main_tab] = {
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
            initial_state: @initial_state,
            rails_bytes_combos: @rails_bytes_combos
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app -d db-option2 --skip-checkbox-option1')
        end

        def test_command_line_output_for_db2_and_all_checkboxes_selected
          @initial_state[:main_tab] = {
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
            initial_state: @initial_state,
            rails_bytes_combos: @rails_bytes_combos
          ))

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app -d db-option2')
        end
      end
    end
  end
end
