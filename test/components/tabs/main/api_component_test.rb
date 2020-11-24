require 'view_component/test_case'

module Tabs
  module Main
    class ApiComponentTest < ViewComponent::TestCase
      include CustomAsserts
      include RailsNewIo::BaseStateItemsChecks::ApiMode::MainTab

      def setup
        @state_translation = Rails.configuration.state_translation
        @base_states = Rails.configuration.base_states
        @all_menu_cards_in_all_states = Rails.configuration.all_menu_cards_in_all_states
      end

      def test_api_mode_menu_card_setup
        render_inline(Tabs::Main::Component.new(
          all_menu_cards_in_all_states: @all_menu_cards_in_all_states,
          state_translation: @state_translation,
          initial_state: @base_states[:api_state]
        ))

        verify_api_mode_main_tab_items_checked
        verify_api_mode_main_tab_items_locked
      end
    end
  end
end
