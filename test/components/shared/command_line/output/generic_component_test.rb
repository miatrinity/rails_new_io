require "view_component/test_case"

module Shared
  module CommandLine
    module Output
      class GenericComponentTest < ViewComponent::TestCase
        include RailsNewIo::CustomAsserts

        def setup
          @state_translation = {
            main_tab: {
              database_config: {
                database_choice: {
                  DB1: {true => "", false => ""},
                  DB2: {true => "-d db-option2", false => ""}
                }
              },
              rails_flags_config: {
                checkbox_items: {
                  Checkbox1: {true => "", false => "--skip-checkbox-option1"},
                  Checkbox2: {true => "", false => "--skip-checkbox-option2"}
                }
              }
            },
            classics_tab: {
              rails_bytes_config: {
                rails_byte_radio_button_menu_card1: {
                  rails_byte1: {true => "", false => ""},
                  rails_byte2: {true => "", false => ""}
                },
                rails_byte_radio_button_menu_card2: {
                  rails_byte3: {true => "", false => ""},
                  rails_byte4: {true => "", false => ""}
                }
              }
            }
          }

          @initial_state = {
            main_tab: {
              database_config: {
                database_choice: {
                  DB1: {checked: true, locked: nil},
                  DB2: {checked: false, locked: nil}
                }
              },
              ui_config: {
                base_setup: {
                  api: {checked: nil, locked: nil},
                  state1: {checked: nil, locked: nil},
                  state2: {checked: nil, locked: nil}
                }
              },
              rails_flags_config: {
                checkbox_items: {
                  Checkbox1: {checked: nil, locked: nil},
                  Checkbox2: {checked: nil, locked: nil}
                }
              }
            },
            classics_tab: {
              rails_bytes_config: {
                rails_byte_radio_button_menu_card1: {
                  rails_byte1: {checked: true, locked: nil},
                  rails_byte2: {checked: false, locked: nil}
                },
                rails_byte_radio_button_menu_card2: {
                  rails_byte3: {checked: true, locked: nil},
                  rails_byte4: {checked: false, locked: nil}
                }
              }
            }
          }

          @rails_bytes_combos = {
            "rails-byte-radio-button-menu-card1-rails-byte1@rails-byte-radio-button-menu-card2-rails-byte3" => "",
            "rails-byte-radio-button-menu-card1-rails-byte1@rails-byte-radio-button-menu-card2-rails-byte4" => "url2",
            "rails-byte-radio-button-menu-card1-rails-byte2@rails-byte-radio-button-menu-card2-rails-byte3" => "url3",
            "rails-byte-radio-button-menu-card1-rails-byte2@rails-byte-radio-button-menu-card2-rails-byte4" => "url4"
          }
        end

        def test_initital_command_line_output
          render_component

          assert_command_line_equals "rails new my_app"
        end

        def test_command_line_output_for_db1_and_checkbox1_selected
          @initial_state[:main_tab] = {
            database_config: {
              database_choice: {
                DB1: {checked: true, locked: nil},
                DB2: {checked: false, locked: nil}
              }
            },
            ui_config: {
              base_setup: {
                api: {checked: nil, locked: nil},
                state1: {checked: nil, locked: nil},
                state2: {checked: nil, locked: nil}
              }
            },
            rails_flags_config: {
              checkbox_items: {
                Checkbox1: {checked: true, locked: nil},
                Checkbox2: {checked: false, locked: nil}
              }
            }
          }

          render_component

          assert_command_line_equals "rails new my_app --skip-checkbox-option2"
        end

        def test_command_line_output_for_db2_and_checkbox2_selected
          @initial_state[:main_tab] = {
            database_config: {
              database_choice: {
                DB1: {checked: false, locked: nil},
                DB2: {checked: true, locked: nil}
              }
            },
            ui_config: {
              base_setup: {
                api: {checked: nil, locked: nil},
                state1: {checked: nil, locked: nil},
                state2: {checked: nil, locked: nil}
              }
            },
            rails_flags_config: {
              checkbox_items: {
                Checkbox1: {checked: false, locked: nil},
                Checkbox2: {checked: true, locked: nil}
              }
            }
          }

          render_component

          assert_command_line_equals "rails new my_app -d db-option2 --skip-checkbox-option1"
        end

        def test_command_line_output_for_db2_and_no_checkboxes_selected
          @initial_state[:main_tab] = {
            database_config: {
              database_choice: {
                DB1: {checked: false, locked: nil},
                DB2: {checked: true, locked: nil}
              }
            },
            ui_config: {
              base_setup: {
                api: {checked: nil, locked: nil},
                state1: {checked: nil, locked: nil},
                state2: {checked: nil, locked: nil}
              }
            },
            rails_flags_config: {
              checkbox_items: {
                Checkbox1: {checked: false, locked: nil},
                Checkbox2: {checked: false, locked: nil}
              }
            }
          }

          render_component

          assert_command_line_equals "rails new my_app -d db-option2 --skip-checkbox-option1 --skip-checkbox-option2"
        end

        def test_command_line_output_for_rails_byte1_and_rails_byte3_selected
          render_component

          assert_selector(:xpath, "//p[@id='rails-new-output-text']", text: "rails new my_app")
        end

        def test_command_line_output_for_rails_byte1_and_rails_byte4_selected
          @initial_state[:classics_tab] = {
            rails_bytes_config: {
              rails_byte_radio_button_menu_card1: {
                rails_byte1: {checked: true, locked: nil},
                rails_byte2: {checked: false, locked: nil}
              },
              rails_byte_radio_button_menu_card2: {
                rails_byte3: {checked: false, locked: nil},
                rails_byte4: {checked: true, locked: nil}
              }
            }
          }

          render_component

          assert_command_line_equals "rails new my_app --template url2"
        end

        def test_command_line_output_for_rails_byte2_and_rails_byte3_selected
          @initial_state[:classics_tab] = {
            rails_bytes_config: {
              rails_byte_radio_button_menu_card1: {
                rails_byte1: {checked: false, locked: nil},
                rails_byte2: {checked: true, locked: nil}
              },
              rails_byte_radio_button_menu_card2: {
                rails_byte3: {checked: true, locked: nil},
                rails_byte4: {checked: false, locked: nil}
              }
            }
          }

          render_component

          assert_command_line_equals "rails new my_app --template url3"
        end

        def test_command_line_output_for_rails_byte2_and_rails_byte4_selected
          @initial_state[:classics_tab] = {
            rails_bytes_config: {
              rails_byte_radio_button_menu_card1: {
                rails_byte1: {checked: false, locked: nil},
                rails_byte2: {checked: true, locked: nil}
              },
              rails_byte_radio_button_menu_card2: {
                rails_byte3: {checked: false, locked: nil},
                rails_byte4: {checked: true, locked: nil}
              }
            }
          }

          render_component

          assert_command_line_equals "rails new my_app --template url4"
        end

        def test_command_line_output_for_db2_and_checkbox2_and_rails_byte2_and_rails_byte4_selected
          @initial_state = {
            main_tab: {
              database_config: {
                database_choice: {
                  DB1: {checked: false, locked: nil},
                  DB2: {checked: true, locked: nil}
                }
              },
              ui_config: {
                base_setup: {
                  api: {checked: nil, locked: nil},
                  state1: {checked: nil, locked: nil},
                  state2: {checked: nil, locked: nil}
                }
              },
              rails_flags_config: {
                checkbox_items: {
                  Checkbox1: {checked: false, locked: nil},
                  Checkbox2: {checked: true, locked: nil}
                }
              }
            },
            classics_tab: {
              rails_bytes_config: {
                rails_byte_radio_button_menu_card1: {
                  rails_byte1: {checked: false, locked: nil},
                  rails_byte2: {checked: true, locked: nil}
                },
                rails_byte_radio_button_menu_card2: {
                  rails_byte3: {checked: false, locked: nil},
                  rails_byte4: {checked: true, locked: nil}
                }
              }
            }
          }

          render_component

          assert_command_line_equals "rails new my_app -d db-option2 --skip-checkbox-option1 --template url4"
        end

        def test_command_line_output_for_db2_and_checkbox2_and_rails_byte1_and_rails_byte3_selected
          @initial_state = {
            main_tab: {
              database_config: {
                database_choice: {
                  DB1: {checked: false, locked: nil},
                  DB2: {checked: true, locked: nil}
                }
              },
              ui_config: {
                base_setup: {
                  api: {checked: nil, locked: nil},
                  state1: {checked: nil, locked: nil},
                  state2: {checked: nil, locked: nil}
                }
              },
              rails_flags_config: {
                checkbox_items: {
                  Checkbox1: {checked: false, locked: nil},
                  Checkbox2: {checked: true, locked: nil}
                }
              }
            },
            classics_tab: {
              rails_bytes_config: {
                rails_byte_radio_button_menu_card1: {
                  rails_byte1: {checked: true, locked: nil},
                  rails_byte2: {checked: false, locked: nil}
                },
                rails_byte_radio_button_menu_card2: {
                  rails_byte3: {checked: true, locked: nil},
                  rails_byte4: {checked: false, locked: nil}
                }
              }
            }
          }

          render_component

          assert_command_line_equals "rails new my_app -d db-option2 --skip-checkbox-option1"
        end

        private

        def render_component
          render_inline(Shared::CommandLine::Output::Component.new(
            state_translation: @state_translation,
            initial_state: @initial_state,
            rails_bytes_combos: @rails_bytes_combos
          ))
        end
      end
    end
  end
end
