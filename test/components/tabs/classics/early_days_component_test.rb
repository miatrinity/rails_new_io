require "view_component/test_case"

module Tabs
  module Classics
    class EarlyDaysComponentTest < ViewComponent::TestCase
      include RailsNewIo::BaseStateItemsChecks::EarlyDays::ClassicsTab

      def setup
        @state_translation = Rails.configuration.state_translation
        @base_states = Rails.configuration.base_states
        @all_menu_cards_in_all_states = Rails.configuration.all_menu_cards_in_all_states
      end

      def test_early_days_menu_card_setup
        render_inline(Tabs::Classics::Component.new(
          all_menu_cards_in_all_states: @all_menu_cards_in_all_states,
          state_translation: @state_translation,
          initial_state: @base_states[:early_state]
        ))

        verify_early_days_classics_tab_items_checked
      end
    end
  end
end
