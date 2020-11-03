module Main
  module CommandLine
    module Output
      class Component < ViewComponent::Base
        def initialize(initial_state:, state_translation:)
          @app_name = 'my_app'
          @initial_state = initial_state
          @state_translation = state_translation

          @database_choice = database_choice
          @rails_flags = rails_flags
          @command_line_output = command_line_output
        end

        private

        def database_choice
          database_choice = @initial_state[:database_choice].find { |_, checked| checked }
          database_name, database_checked = *database_choice

          @state_translation[:database_choice][database_name][database_checked]
        end

        def rails_flags
          @initial_state[:rails_flags].each_with_object([]) do |(menu_card, items), result|
            result << items.map do |item_name, checked|
              @state_translation[:rails_flags][menu_card][item_name][checked]
            end
          end.flatten.reject{|s| s.blank?}.join(' ')
        end

        def command_line_output
          "rails new #{app_name_output}#{database_choice_output}#{rails_flags_output}".html_safe
        end

        def app_name_output
          content_tag :span, 'data-target' => 'app-name.output' do
            @app_name
          end
        end

        def database_choice_output
          content_tag :span, id: 'database-choice' do
            with_spacer @database_choice
          end
        end

        def rails_flags_output
          content_tag :span, id: 'rails-flags' do
            with_spacer @rails_flags
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
