require 'view_component/test_case'

module Tabs
  module Main
    class MinimalistComponentTest < ViewComponent::TestCase
      include RailsNewIo::CustomAsserts
      include RailsNewIo::BaseStateItemsChecks::Minimalist::MainTab

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

        verify_minimalist_main_tab_items_checked
        verify_minimalist_main_tab_items_locked
      end
    end
  end
end
