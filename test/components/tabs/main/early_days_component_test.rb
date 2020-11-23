require 'view_component/test_case'

module Tabs
  module Main
    class EarlyDaysComponentTest < ViewComponent::TestCase
      def setup
        @state_translation = Rails.configuration.state_translation
        @base_states = Rails.configuration.base_states
        @all_menu_cards_in_all_states = Rails.configuration.all_menu_cards_in_all_states
      end

      def test_early_days_menu_card_setup
        render_inline(Tabs::Main::Component.new(
          all_menu_cards_in_all_states: @all_menu_cards_in_all_states,
          state_translation: @state_translation,
          initial_state: @base_states[:early_state]
        ))

        ##########
        #
        # Main Tab
        #
        ##########

        # Time to Start Cooking Menu card
        refute page.find('#main-tab-base-setup-omakase').checked?
        refute page.find('#main-tab-base-setup-api').checked?
        assert page.find('#main-tab-base-setup-early').checked?
        refute page.find('#main-tab-base-setup-minimalist').checked?

        # Our Database Menu Menu card
        assert page.find('#main-tab-database-choice-sqlite').checked?
        refute page.find('#main-tab-database-choice-postgres').checked?
        refute page.find('#main-tab-database-choice-mysql').checked?

        # Guest Favorites Menu card
        refute page.find('#main-tab-guest-favorites-spring').checked?
        refute page.find('#main-tab-guest-favorites-listen').checked?
        refute page.find('#main-tab-guest-favorites-bootsnap').checked?

        # Starters Menu card
        assert page.find('#main-tab-starters-gemfile').checked?
        assert page.find('#main-tab-starters-gitignore').checked?
        refute page.find('#main-tab-starters-keep').checked?
        assert page.find('#main-tab-starters-bundle').checked?
        assert page.find('#main-tab-starters-puma').checked?

        # Mains Menu card
        refute page.find('#main-tab-mains-actiontext').checked?
        assert page.find('#main-tab-mains-activerecord').checked?
        refute page.find('#main-tab-mains-activestorage').checked?
        refute page.find('#main-tab-mains-actioncable').checked?

        # Email me Maybe (#not) Menu card
        assert page.find('#main-tab-email-actionmailer').checked?
        refute page.find('#main-tab-email-actionmailbox').checked?

        # Le Frontend Menu card
        assert page.find('#main-tab-frontend-sprockets').checked?
        refute page.find('#main-tab-frontend-javascript').checked?
        refute page.find('#main-tab-frontend-turbolinks').checked?
        refute page.find('#main-tab-frontend-webpacker').checked?
        refute page.find('#main-tab-frontend-yarn').checked?

        # Testing Menu card
        assert page.find('#main-tab-testing-minitest').checked?
        refute page.find('#main-tab-testing-system').checked?

      end
    end
  end
end