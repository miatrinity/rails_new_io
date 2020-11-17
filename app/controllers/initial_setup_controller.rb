# frozen_string_literal: true

# nodoc
class InitialSetupController < ApplicationController
  def index
    # menu_card_in_all_states
    # all_menu_cards_in_all_states
    # menu_card_in_a_specific_state
    # all_menu_cards_in_a_specific_state

    # base state: all possible initial states
    # initial state: base state we are initially loading from the server
    @state_translation = Rails.configuration.state_translation
    @base_states = Rails.configuration.base_states
    @initial_state = Rails.configuration.initial_state
    @all_menu_cards_in_all_states = Rails.configuration.all_menu_cards_in_all_states

    # @single_rails_bytes = {
    #   frontend: {
    #     none: '',
    #     stimulus: 'https://www.railsbytes.com/script/V33s33',
    #     "stimulus-reflex": 'https://www.railsbytes.com/script/zr4s0Y'
    #   },
    #   testing: {
    #     minitest: '',
    #     rspec: 'https://www.railsbytes.com/script/VD7sra'
    #   },
    #   css: {
    #     none: '',
    #     tailwind: '',
    #     bootstrap: ''
    #   }
    # }


    
    # combos = RailsNewIo::RailsBytesComboGenerator.new(@single_rails_bytes).generate
    # puts combos.each_with_object({}){|v,a| a[v] = ''}.to_yaml
    
    # ap combos
    
    @rails_bytes_combos = YAML::load(File.open("#{Rails.root}/config/app/rails_bytes_combos.yaml"))        
  end
end
