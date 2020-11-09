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
        },
        starters: {
          gemfile: { true => '', false => '--skip-gemfile' },
          gitignore: { true => '', false => '--skip-git' },
          keep: { true => '', false => '--skip-keeps' },
          bundle: { true => '', false => '--skip-bundle' },
          puma: { true => '', false => '--skip-puma' }
        },
        mains: {
          actionText: { true => '', false => '--skip-action-text' },
          activeRecord: { true => '', false => '--skip-active-record' },
          activeStorage: { true => '', false => '--skip-active-storage' },
          actionCable: { true => '', false => '--skip-action-cable' }
        }
      }
    }

    @omakase_state = {
      database_choice: {
        SQLite: true,
        Postgres: false,
        MySQL: false

      },
      rails_flags: {
        guest_favorites: {
          spring: true,
          listen: true,
          bootsnap: true
        },
        starters: {
          gemfile: true,
          gitignore: true,
          keep: true,
          bundle: true,
          puma: true
        },
        mains: {
          actionText: true,
          activeRecord: true,
          activeStorage: true,
          actionCable: true
        }
      }
    }

    @initial_state = @omakase_state
  end
end
