require 'view_component/test_case'

module Main
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
            state_translation: {
              menu_card_id: {
                Option1: { true => '', false => '' },
                Option2: { true => '-d option1', false => '' },
              }
            },
            initial_state: {
              menu_card_id: {
                Option1: nil,
                Option2: nil
              }
            }
          }
        end

        def test_render_title_and_subtitle_for_radio_button_menu_card_component
          render_inline(Main::MenuCard::RadioButton::Component.new(@component_setup))

          assert_text('Title')
          assert_text('Subtitle')
        end

        def test_render_row_title_and_description_for_radio_button_menu_card_component
          render_inline(Main::MenuCard::RadioButton::Component.new(@component_setup))

          assert_text('Option1')
          assert_text('Desc 1')
          assert_text('Option2')
          assert_text('Desc 2')
        end

        def test_first_item_checked_for_radio_button_menu_card_component
          @component_setup[:initial_state] = {
            menu_card_id: {
              Option1: true,
              Option2: false
            }
          }

          render_inline(Main::MenuCard::RadioButton::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='Option1' and @checked]")
        end

        def test_second_item_checked_for_radio_button_menu_card_component
          @component_setup[:initial_state] = {
            menu_card_id: {
              Option1: false,
              Option2: true
            }
          }

          render_inline(Main::MenuCard::RadioButton::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='Option2' and @checked]")
        end
      end
    end
  end
end