# frozen_string_literal: true

# nodoc
class InitialSetupController < ApplicationController
  def index
    @state_translation = YAML::load(File.open("#{Rails.root}/config/app/state_translation.yaml"))
    @initial_states = YAML::load(File.open("#{Rails.root}/config/app/initial_states.yaml"))
    @initial_state = @initial_states[:omakase_state]
    
    # binding.pry
    
    # @initial_states2 = {}
    
    # @initial_states.each do |state_name, state_data|
      
    # end
      

      # :rails_flags:
      #   :guest_favorites:
      #     :spring: { omakase: true, early: false }
      #     :listen: true
      #     :bootsnap: true

            
      
  end
end
