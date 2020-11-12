require 'view_component/test_case'

module Main
  class OmakaseComponentTest < ViewComponent::TestCase
    def setup
      @state_translation = YAML::load(File.open("#{Rails.root}/config/app/state_translation.yaml"))
      @initial_states = YAML::load(File.open("#{Rails.root}/config/app/initial_states.yaml"))      
    end

    def test_omakase_menu_card_setup
      render_inline(Main::Component.new(
        initial_states: @initial_states,
        state_translation: @state_translation,
        initial_state: @initial_states[:omakase_state]
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
