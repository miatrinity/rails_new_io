# frozen_string_literal: true

# nodoc
class InitialSetupController < ApplicationController
  def index
    @state_translation = {
      base_setup: {
        omakase: { true => '', false => '' },
        api: { true => '', false => '' },
        early: { true => '', false => '' },
        minimalist: { true => '', false => '' }
      },
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
        },
        email: {
          actionMailer: { true => '', false => '--skip-action-mailer' },
          actionMailbox: { true => '', false => '--skip-action-mailbox' }
        },
        frontend: {
          sprockets: { true => '', false => '--skip-sprockets' },
          javascript: { true => '', false => '--skip-javascript' },
          turbolinks: { true => '', false => '--skip-turbolinks' },
          webpacker: { true => '', false => '--skip-webpack-install' },
          yarn: { true => '', false => '--skip-yarn' }
        },
        testing: {
          minitest: { true => '', false => '--skip-test' },
          system: { true => '', false => '--skip-system-test' }
        },
      }
    }

    @initial_states = {
      omakase_state: {
        base_setup: {
          omakase: true,
          api: false,
          early: false,
          minimalist: false
        },
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
          },
          email: {
            actionMailer: true,
            actionMailbox: true
          },
          frontend: {
            sprockets: true,
            javascript: true,
            turbolinks: true,
            webpacker: true,
            yarn: true
          },
          testing: {
            minitest: true,
            system: true
          }
        }
      },
      early_state: {
        base_setup: {
          omakase: false,
          api: false,
          early: true,
          minimalist: false
        },
        database_choice: {
          SQLite: true,
          Postgres: false,
          MySQL: false
        },
        rails_flags: {
          guest_favorites: {
            spring: false,
            listen: false,
            bootsnap: false
          },
          starters: {
            gemfile: true,
            gitignore: true,
            keep: false,
            bundle: true,
            puma: true
          },
          mains: {
            actionText: false,
            activeRecord: true,
            activeStorage: false,
            actionCable: false
          },
          email: {
            actionMailer: true,
            actionMailbox: false
          },
          frontend: {
            sprockets: true,
            javascript: false,
            turbolinks: false,
            webpacker: false,
            yarn: false
          },
          testing: {
            minitest: true,
            system: false
          }
        }
      }
    }

    @initial_state = @initial_states[:omakase_state]
  end
end
