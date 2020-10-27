module Main
  module MenuCard
    module Checkbox
      class Component < ViewComponent::Base
        def initialize(title:, subtitle:, items:, initial_state:, state_translation:)
          @title      = title
          @subtitle   = subtitle
          @items      = items
          @initial_state = initial_state
          @state_translation = state_translation
          
          update_items
        end
        
        private

        def update_items
          @initial_state[:rails_flags][:guest_favorites].each do |item_name, checked|
            command_output = @state_translation[:rails_flags][:guest_favorites][item_name][false]

            item_to_update = @items.find{ |item| item[:title].include?(item_name.to_s) }

            item_to_update.merge!({
              command_output: command_output,
              checked: checked
            })
          end
          
          p @items
        end
      end
    end
  end
end

=begin
@state_translation = {
  database_choice: {
    SQLite: { true => '', false => '' },
    Postgres: { true => '-d postgresql', false => '' },
    MySQL: { true => '-d mysql', false => '' }
  },
  rails_flags: {
    guest_favorites: {
      spring: { true => '', false => '--skip-spring' },
      listen: { true => '', false => '--skip-listen' },
      bootsnap: { true => '', false => '--skip-bootsnap'}
    }
  }
}

@omakase_state = {
  app_name: 'my_app',
  database_choice: {
    SQLite: true,
    Postgres: false,
    MySQL: false
    
  },
  rails_flags: {
    guest_favorites: {
      spring: false,
      listen: false,
      bootsnap: true
    }
  }
=end