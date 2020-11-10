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
      @omakase_state = {
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
      }
    end

    def test_omakase_menu_card_setup
      render_inline(Main::Component.new(
        state_translation: @state_translation,
        initial_state: @omakase_state
      ))

      # Time to Start Cooking Menu card
      assert page.find('#omakase').checked?
      refute page.find('#api-mode').checked?
      refute page.find('#the-early-days').checked?
      refute page.find('#the-minimalist').checked?

      # Our Database Menu Menu card
      assert page.find('#sqlite').checked?
      refute page.find('#postgres').checked?
      refute page.find('#mysql').checked?

      # Guest Favorites Menu card
      assert page.find('#add-spring').checked?
      assert page.find('#add-listen').checked?
      assert page.find('#add-bootsnap').checked?

      # Starters Menu card
      assert page.find('#create-gemfile').checked?
      assert page.find('#create-gitignore').checked?
      assert page.find('#create-keep-files').checked?
      assert page.find('#run-bundle-install').checked?
      assert page.find('#create-puma-config-files-skip-if-using-a-different-app-server').checked?

      # Mains Menu card
      assert page.find('#use-actiontext').checked?
      assert page.find('#use-activerecord').checked?
      assert page.find('#use-activestorage').checked?
      assert page.find('#use-actioncable').checked?

      # Email me Maybe (#not) Menu card
      assert page.find('#use-actionmailer').checked?
      assert page.find('#use-actionmailbox').checked?

      # Le Frontend Menu card
      assert page.find('#use-sprockets').checked?
      assert page.find('#use-javascript').checked?
      assert page.find('#use-turbolinks').checked?
      assert page.find('#use-webpacker').checked?
      assert page.find('#use-yarn').checked?

      # Testing Menu card
      assert page.find('#use-minitest').checked?
      assert page.find('#use-system-tests').checked?
    end
  end
end
