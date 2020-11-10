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
      @early_days_state = {
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
      end

    def test_omakase_menu_card_setup
      render_inline(Main::Component.new(
        state_translation: @state_translation,
        initial_state: @early_days_state
      ))

      # Time to Start Cooking Menu card
      refute page.find('#omakase').checked?
      refute page.find('#api-mode').checked?
      assert page.find('#the-early-days').checked?
      refute page.find('#the-minimalist').checked?

      # Our Database Menu Menu card
      assert page.find('#sqlite').checked?
      refute page.find('#postgres').checked?
      refute page.find('#mysql').checked?

      # Guest Favorites Menu card
      refute page.find('#add-spring').checked?
      refute page.find('#add-listen').checked?
      refute page.find('#add-bootsnap').checked?

      # Starters Menu card
      assert page.find('#create-gemfile').checked?
      assert page.find('#create-gitignore').checked?
      refute page.find('#create-keep-files').checked?
      assert page.find('#run-bundle-install').checked?
      assert page.find('#create-puma-config-files-skip-if-using-a-different-app-server').checked?

      # Mains Menu card
      refute page.find('#use-actiontext').checked?
      assert page.find('#use-activerecord').checked?
      refute page.find('#use-activestorage').checked?
      refute page.find('#use-actioncable').checked?

      # Email me Maybe (#not) Menu card
      assert page.find('#use-actionmailer').checked?
      refute page.find('#use-actionmailbox').checked?

      # Le Frontend Menu card
      assert page.find('#use-sprockets').checked?
      refute page.find('#use-javascript').checked?
      refute page.find('#use-turbolinks').checked?
      refute page.find('#use-webpacker').checked?
      refute page.find('#use-yarn').checked?

      # Testing Menu card
      assert page.find('#use-minitest').checked?
      refute page.find('#use-system-tests').checked?
    end
  end
end
