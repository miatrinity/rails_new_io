module Shared
  module CommandLine
    module Output
      class Component < ViewComponent::Base
        def initialize(initial_state:, state_translation:)
          @app_name            = 'my_app'
          @initial_state       = initial_state
          @state_translation   = state_translation

          @command_line_output = command_line_output
        end

        private

        def database_choice
          database_choice = @initial_state[:main_tab][:database_config][:database_choice].find { |_, checked| checked }
          database_name, database_checked = *database_choice

          @state_translation[:main_tab][:database_config][:database_choice][database_name][database_checked]
        end

        def rails_flags
          @initial_state[:main_tab][:rails_flags_config].each_with_object([]) do |(menu_card, items), result|
            result << items.map do |item_name, checked|
              @state_translation[:main_tab][:rails_flags_config][menu_card][item_name][checked]
            end
          end.flatten.reject(&:blank?).sort.join(' ')
        end

        def command_line_output
          "<code>rails new </code>#{app_name_output}#{api_flag_output}#{database_choice_output}#{rails_flags_output}#{rails_bytes_output}".html_safe
        end

        def rails_bytes_url
          rails_bytes_choice = @initial_state[:classics_tab][:rails_bytes_config][:testing].find { |_, checked| checked }

          rails_bytes_name, rails_bytes_checked = *rails_bytes_choice          
          @state_translation[:classics_tab][:rails_bytes_config][:testing][rails_bytes_name][rails_bytes_checked]
        end

        def rails_bytes
          return '' if rails_bytes_url.blank?

          "--template #{rails_bytes_url}"
        end

        def api_flag_output
          content_tag :code, id: 'api-flag' do
            api_flag_value = @initial_state[:main_tab][:ui_config][:base_setup][:api] ? '--api' : ''
            with_spacer api_flag_value
          end
        end

        def app_name_output
          content_tag :code, 'data-target' => 'app-name.output' do
            @app_name
          end
        end

        def database_choice_output
          content_tag :code, id: 'database-choice' do
            with_spacer database_choice
          end
        end

        def rails_flags_output
          content_tag :code, id: 'rails-flags' do
            with_spacer rails_flags
          end
        end

        def rails_bytes_output
          content_tag :code, id: 'rails-bytes' do
            with_spacer rails_bytes
          end
        end

        def with_spacer(data)
          spacer = data.present? ? ' ' : ''
          "#{spacer}#{data}"
        end
      end
    end
  end
end
