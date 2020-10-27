# frozen_string_literal: true

# nodoc
class InitialSetupController < ApplicationController
  def index
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
          spring: true,
          listen: false,
          bootsnap: true
        }
      }
    }

    @initial_state = @omakase_state
  end
end