require "view_component/test_case"

module Tabs
  module Main
    class OmakaseComponentTest < ViewComponent::TestCase
      include RailsNewIo::CustomAsserts
      include RailsNewIo::BaseStateItemsChecks::Omakase::MainTab

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

        verify_omakase_main_tab_items_checked
        verify_omakase_main_tab_items_locked
      end
    end
  end
end
