require 'view_component/test_case'

module Shared
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
            'rails-byte-radio-button-menu-card1-rails-byte1@rails-byte-radio-button-menu-card2-rails-byte3' => '',
            'rails-byte-radio-button-menu-card1-rails-byte1@rails-byte-radio-button-menu-card2-rails-byte4' => 'url2',
            'rails-byte-radio-button-menu-card1-rails-byte2@rails-byte-radio-button-menu-card2-rails-byte3' => 'url3',
            'rails-byte-radio-button-menu-card1-rails-byte2@rails-byte-radio-button-menu-card2-rails-byte4' => 'url4',
          }
        end

        def test_initital_command_line_output
          render_component

          assert_command_line_equals 'rails new my_app'
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

          render_component

          assert_command_line_equals 'rails new my_app --skip-checkbox-option2'
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

          render_component

          assert_command_line_equals 'rails new my_app -d db-option2 --skip-checkbox-option1'
        end

        def test_command_line_output_for_db2_and_no_checkboxes_selected
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

          render_component

          assert_command_line_equals 'rails new my_app -d db-option2 --skip-checkbox-option1 --skip-checkbox-option2'
        end

        def test_command_line_output_for_rails_byte1_and_rails_byte3_selected
          render_component

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: 'rails new my_app')
        end

        def test_command_line_output_for_rails_byte1_and_rails_byte4_selected
          @initial_state[:classics_tab] = {
            rails_bytes_config: {
              rails_byte_radio_button_menu_card1: { rails_byte1: true, rails_byte2: false },
              rails_byte_radio_button_menu_card2: { rails_byte3: false, rails_byte4: true }
            }
          }

          render_component

          assert_command_line_equals 'rails new my_app --template url2'
        end

        def test_command_line_output_for_rails_byte2_and_rails_byte3_selected
          @initial_state[:classics_tab] = {
            rails_bytes_config: {
              rails_byte_radio_button_menu_card1: { rails_byte1: false, rails_byte2: true },
              rails_byte_radio_button_menu_card2: { rails_byte3: true, rails_byte4: false }
            }
          }

          render_component

          assert_command_line_equals 'rails new my_app --template url3'
        end

        def test_command_line_output_for_rails_byte2_and_rails_byte4_selected
          @initial_state[:classics_tab] = {
            rails_bytes_config: {
              rails_byte_radio_button_menu_card1: { rails_byte1: false, rails_byte2: true },
              rails_byte_radio_button_menu_card2: { rails_byte3: false, rails_byte4: true }
            }
          }

          render_component

          assert_command_line_equals 'rails new my_app --template url4'
        end

        def test_command_line_output_for_db2_and_checkbox2_and_rails_byte2_and_rails_byte4_selected
          @initial_state = {
            main_tab: {
              database_config: {
                database_choice: { DB1: false, DB2: true }
              },
              ui_config: {
                base_setup: { state1: nil, state2: nil }
              },
              rails_flags_config: {
                checkbox_items: { Checkbox1: false, Checkbox2: true }
              }
            },
            classics_tab: {
              rails_bytes_config: {
                rails_byte_radio_button_menu_card1: { rails_byte1: false, rails_byte2: true },
                rails_byte_radio_button_menu_card2: { rails_byte3: false, rails_byte4: true }
              }
            }
          }

          render_component

          assert_command_line_equals 'rails new my_app -d db-option2 --skip-checkbox-option1 --template url4'
        end

        def test_command_line_output_for_db2_and_checkbox2_and_rails_byte1_and_rails_byte3_selected
          @initial_state = {
            main_tab: {
              database_config: {
                database_choice: { DB1: false, DB2: true }
              },
              ui_config: {
                base_setup: { state1: nil, state2: nil }
              },
              rails_flags_config: {
                checkbox_items: { Checkbox1: false, Checkbox2: true }
              }
            },
            classics_tab: {
              rails_bytes_config: {
                rails_byte_radio_button_menu_card1: { rails_byte1: true, rails_byte2: false },
                rails_byte_radio_button_menu_card2: { rails_byte3: true, rails_byte4: false }
              }
            }
          }

          render_component

          assert_command_line_equals 'rails new my_app -d db-option2 --skip-checkbox-option1'
        end

        private

        def render_component
          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @state_translation,
            initial_state: @initial_state,
            rails_bytes_combos: @rails_bytes_combos
          ))
        end

        def assert_command_line_equals(expected_command_line_output)
          command_line_output = page.find(:xpath, "//p[@id='rails-new-output-text']").text

          assert_equal command_line_output.squish, expected_command_line_output
        end
      end
    end
  end
end
