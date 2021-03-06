module Shared
  module CommandLine
    module Output
      class Component < ViewComponent::Base
        def initialize(initial_state:, state_translation:, rails_bytes_combos:)
          @app_name = "my_app"
          @initial_state = initial_state
          @state_translation = state_translation
          @rails_bytes_combos = rails_bytes_combos

          @command_line_output = command_line_output
        end

        private

        def database_choice
          database_choice = @initial_state[:main_tab][:database_config][:database_choice].find { |_, display_state| display_state[:checked] == true }
          database_name = database_choice[0]

          @state_translation[:main_tab][:database_config][:database_choice][database_name][true]
        end

        def rails_flags
          @initial_state[:main_tab][:rails_flags_config].each_with_object([]) { |(menu_card, items), result|
            result << items.map { |item_name, display_state|
              @state_translation[:main_tab][:rails_flags_config][menu_card][item_name][display_state[:checked]]
            }
          }.flatten.reject(&:blank?).sort.join(" ")
        end

        def command_line_output
          "<code>rails new </code>#{app_name_output}#{api_flag_output}#{database_choice_output}#{rails_flags_output}#{rails_bytes_output}".html_safe
        end

        def rails_bytes_url
          rails_bytes_choices = @initial_state[:classics_tab][:rails_bytes_config].each_with_object([]) { |(menu_card, items), result|
            checked_item_name = items.find { |_, display_state| display_state[:checked] == true }[0]

            result << "#{menu_card}-#{checked_item_name}".dasherize.downcase
          }

          rails_bytes_combos_key = rails_bytes_choices.sort.join("@")

          @rails_bytes_combos[rails_bytes_combos_key]
        end

        def rails_bytes
          return "" if rails_bytes_url.blank?

          "--template #{rails_bytes_url}"
        end

        def api_flag_output
          content_tag :code, id: "api-flag" do
            api_flag_value = @initial_state[:main_tab][:ui_config][:base_setup][:api][:checked] ? "--api" : ""
            with_spacer api_flag_value
          end
        end

        def app_name_output
          content_tag :code, "data-target" => "app-name.output" do
            @app_name
          end
        end

        def database_choice_output
          content_tag :code, id: "database-choice" do
            with_spacer database_choice
          end
        end

        def rails_flags_output
          content_tag :code, id: "rails-flags" do
            with_spacer rails_flags
          end
        end

        def rails_bytes_output
          content_tag :code, id: "rails-bytes" do
            with_spacer rails_bytes
          end
        end

        def with_spacer(data)
          spacer = data.present? ? " " : ""
          "#{spacer}#{data}"
        end
      end
    end
  end
end
