require 'view_component/test_case'

module Main
  class OmakaseComponentTest < ViewComponent::TestCase
    def setup
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
        early_days_state: {
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

    def test_omakase_menu_card_setup
      render_inline(Main::Component.new(
        initial_states: @initial_states,
        state_translation: @state_translation,
        initial_state: @initial_state
      ))

      # Time to Start Cooking Menu card
      assert page.find('#base-setup-omakase').checked?
      refute page.find('#base-setup-api').checked?
      refute page.find('#base-setup-early').checked?
      refute page.find('#base-setup-minimalist').checked?

      # Our Database Menu Menu card
      assert page.find('#database-choice-SQLite').checked?
      refute page.find('#database-choice-Postgres').checked?
      refute page.find('#database-choice-MySQL').checked?

      # Guest Favorites Menu card
      assert page.find('#rails-flags-guest-favorites-spring').checked?
      assert page.find('#rails-flags-guest-favorites-listen').checked?
      assert page.find('#rails-flags-guest-favorites-bootsnap').checked?

      # Starters Menu card
      assert page.find('#rails-flags-starters-gemfile').checked?
      assert page.find('#rails-flags-starters-gitignore').checked?
      assert page.find('#rails-flags-starters-keep').checked?
      assert page.find('#rails-flags-starters-bundle').checked?
      assert page.find('#rails-flags-starters-puma').checked?

      # Mains Menu card
      assert page.find('#rails-flags-mains-actionText').checked?
      assert page.find('#rails-flags-mains-activeRecord').checked?
      assert page.find('#rails-flags-mains-activeStorage').checked?
      assert page.find('#rails-flags-mains-actionCable').checked?

      # Email me Maybe (#not) Menu card
      assert page.find('#rails-flags-email-actionMailer').checked?
      assert page.find('#rails-flags-email-actionMailbox').checked?

      # Le Frontend Menu card
      assert page.find('#rails-flags-frontend-sprockets').checked?
      assert page.find('#rails-flags-frontend-javascript').checked?
      assert page.find('#rails-flags-frontend-turbolinks').checked?
      assert page.find('#rails-flags-frontend-webpacker').checked?
      assert page.find('#rails-flags-frontend-yarn').checked?

      # Testing Menu card
      assert page.find('#rails-flags-testing-minitest').checked?
      assert page.find('#rails-flags-testing-system').checked?
    end
  end
end
