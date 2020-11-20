require 'view_component/test_case'

module Shared
  module MenuCard
    module RadioButton
      class ComponentTest < ViewComponent::TestCase
        def setup
          @component_setup = {
            menu_card_id: :menu_card_id,
            title: 'Title',
            subtitle: 'Subtitle',
            items: [
              {
                title: 'Option1',
                description: 'Desc 1',
              },
              {
                title: 'Option2',
                description: 'Desc 2',
              },
            ],
            card_state_translation: {
              Option1: { true => '', false => '' },
              Option2: { true => '-d option1', false => '' },
            },
            menu_card_in_all_states: {
              Option1: { base_state1: true, base_state2: false},
              Option2: { base_state1: false, base_state2: true}
            },
            menu_card_in_a_specific_state: {
              Option1: nil,
              Option2: nil
            },
            data_controller: nil,
            data_action: nil,
            data_target: nil
          }
        end

        def test_render_title_and_subtitle_for_radio_button_menu_card_component
          render_inline(Shared::MenuCard::RadioButton::Component.new(@component_setup))

          assert_text('Title')
          assert_text('Subtitle')
        end

        def test_render_row_title_and_description_for_radio_button_menu_card_component
          render_inline(Shared::MenuCard::RadioButton::Component.new(@component_setup))

          assert_text('Option1')
          assert_text('Desc 1')
          assert_text('Option2')
          assert_text('Desc 2')
        end

        def test_first_item_checked_for_radio_button_menu_card_component
          @component_setup[:menu_card_in_a_specific_state] = {
            Option1: true,
            Option2: false
          }

          render_inline(Shared::MenuCard::RadioButton::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='menu-card-id-option1' and @checked]")
        end

        def test_second_item_checked_for_radio_button_menu_card_component
          @component_setup[:menu_card_in_a_specific_state] = {
            Option1: false,
            Option2: true
          }

          render_inline(Shared::MenuCard::RadioButton::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='menu-card-id-option2' and @checked]")
        end

        def test_html_data_attributes_are_rendered_correctly
          @component_setup[:menu_card_in_a_specific_state] = {
            Option1: true,
            Option2: false
          }

          render_inline(Shared::MenuCard::RadioButton::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='menu-card-id-option1' and @data-base-state1='true' and @data-base-state2='false']")
          assert_selector(:xpath, "//input[@id='menu-card-id-option2' and @data-base-state1='false' and @data-base-state2='true']")
        end
      end
    end
  end
end
