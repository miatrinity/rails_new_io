module Main
  module CommandLine
    module Output
      class Component < ViewComponent::Base
        def initialize(initial_state:, state_translation:)
          @initial_state = initial_state
          @state_translation = state_translation

          @app_name = @initial_state[:app_name]
          @database_choice = database_choice
          @rails_flags = rails_flags
        end

        private

        def database_choice
          database_choice = @initial_state[:database_choice].find{ |_, checked| checked }
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
      end
    end
  end
end
