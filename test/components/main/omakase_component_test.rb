require 'view_component/test_case'

module Main
  class OmakaseComponentTest < ViewComponent::TestCase
    def setup
      @state_translation = Rails.configuration.state_translation
      @base_states = Rails.configuration.base_states
      @all_menu_cards_in_all_states = Rails.configuration.all_menu_cards_in_all_states
    end

    def test_omakase_menu_card_setup
      render_inline(Tabs::Main::Component.new(
        all_menu_cards_in_all_states: @all_menu_cards_in_all_states,
        state_translation: @state_translation,
        initial_state: @base_states[:omakase_state]
      ))

      # Time to Start Cooking Menu card
      assert page.find('#base-setup-omakase').checked?
      refute page.find('#base-setup-api').checked?
      refute page.find('#base-setup-early').checked?
      refute page.find('#base-setup-minimalist').checked?

      # Our Database Menu Menu card
      assert page.find('#database-choice-sqlite').checked?
      refute page.find('#database-choice-postgres').checked?
      refute page.find('#database-choice-mysql').checked?

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
      assert page.find('#rails-flags-mains-actiontext').checked?
      assert page.find('#rails-flags-mains-activerecord').checked?
      assert page.find('#rails-flags-mains-activestorage').checked?
      assert page.find('#rails-flags-mains-actioncable').checked?

      # Email me Maybe (#not) Menu card
      assert page.find('#rails-flags-email-actionmailer').checked?
      assert page.find('#rails-flags-email-actionmailbox').checked?

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
