require 'view_component/test_case'

module Main
  class MinimalistComponentTest < ViewComponent::TestCase
    def setup
      @state_translation = Rails.configuration.state_translation
      @base_states = Rails.configuration.base_states
      @all_menu_cards_in_all_states = Rails.configuration.all_menu_cards_in_all_states
    end

    def test_menu_cards_setup_in_minimalist_base_state
      render_inline(Tabs::Main::Component.new(
        all_menu_cards_in_all_states: @all_menu_cards_in_all_states,
        state_translation: @state_translation,
        initial_state: @base_states[:minimalist_state]
      ))

      # Time to Start Cooking Menu card
      refute page.find('#base-setup-omakase').checked?
      refute page.find('#base-setup-api').checked?
      refute page.find('#base-setup-early').checked?
      assert page.find('#base-setup-minimalist').checked?

      # Our Database Menu Menu card
      assert page.find('#database-choice-sqlite').checked?
      refute page.find('#database-choice-postgres').checked?
      refute page.find('#database-choice-mysql').checked?

      # Guest Favorites Menu card
      refute page.find('#rails-flags-guest-favorites-spring').checked?
      refute page.find('#rails-flags-guest-favorites-listen').checked?
      refute page.find('#rails-flags-guest-favorites-bootsnap').checked?

      # Starters Menu card
      refute page.find('#rails-flags-starters-gemfile').checked?
      refute page.find('#rails-flags-starters-gitignore').checked?
      refute page.find('#rails-flags-starters-keep').checked?
      refute page.find('#rails-flags-starters-bundle').checked?
      refute page.find('#rails-flags-starters-puma').checked?

      # Mains Menu card
      refute page.find('#rails-flags-mains-actiontext').checked?
      assert page.find('#rails-flags-mains-activerecord').checked?
      refute page.find('#rails-flags-mains-activestorage').checked?
      refute page.find('#rails-flags-mains-actioncable').checked?

      # Email me Maybe (#not) Menu card
      refute page.find('#rails-flags-email-actionmailer').checked?
      refute page.find('#rails-flags-email-actionmailbox').checked?

      # Le Frontend Menu card
      refute page.find('#rails-flags-frontend-sprockets').checked?
      refute page.find('#rails-flags-frontend-javascript').checked?
      refute page.find('#rails-flags-frontend-turbolinks').checked?
      refute page.find('#rails-flags-frontend-webpacker').checked?
      refute page.find('#rails-flags-frontend-yarn').checked?

      # Testing Menu card
      refute page.find('#rails-flags-testing-minitest').checked?
      refute page.find('#rails-flags-testing-system').checked?
    end
  end
end
