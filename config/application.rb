require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsNewIo
  class AllMenuCardsInAllStatesGenerator
    def initialize(base_states:)
      @base_states = base_states
    end

    def generate
      menu_cards_in_all_states_blueprint = @base_states.first[1].deep_dup
      all_initial_states = @base_states.keys

      menu_cards_in_all_states_blueprint.each do |config_id, config_data|
        config_data.each do |menu_card_id, menu_card_data|
          menu_card_data.each do |item_name, item_value|
            menu_card_in_all_states = {}
            all_initial_states.each do |initial_state|
              menu_card_in_all_states[initial_state] = @base_states[initial_state][config_id][menu_card_id][item_name] 
            end
            menu_cards_in_all_states_blueprint[config_id][menu_card_id][item_name] = menu_card_in_all_states
          end
        end
      end

      menu_cards_in_all_states_blueprint
    end
  end

  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.state_translation = YAML::load(File.open("#{Rails.root}/config/app/state_translation.yaml"))
    config.base_states = YAML::load(File.open("#{Rails.root}/config/app/base_states.yaml"))    
    config.initial_state_name = :omakase_state
    config.initial_state = config.base_states[config.initial_state_name]
    config.all_menu_cards_in_all_states = AllMenuCardsInAllStatesGenerator.new(base_states: config.base_states).generate
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
