require 'view_component/test_case'

module Tabs
  module Classics
    class EarlyDaysComponentTest < ViewComponent::TestCase
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

        # Testing Framework Menu Card
        assert page.find('#classics-tab-testing-minitest').checked?
        refute page.find('#classics-tab-testing-rspec').checked?

        # Frontend Framework Menu Card
        assert page.find('#classics-tab-frontend-none').checked?
        refute page.find('#classics-tab-frontend-stimulus').checked?
        refute page.find('#classics-tab-frontend-stimulus-reflex').checked?

        # CSS Framework Menu Card

        assert page.find('#classics-tab-css-none').checked?
        refute page.find('#classics-tab-css-tailwind').checked?
        refute page.find('#classics-tab-css-bootstrap').checked?
      end
    end
  end
end
