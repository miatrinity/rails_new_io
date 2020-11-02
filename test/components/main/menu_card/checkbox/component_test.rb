require 'view_component/test_case'

module Main
  module MenuCard
    module Checkbox
      class ComponentTest < ViewComponent::TestCase
        def setup
          @component_setup = {
            menu_card_id: :menu_card_id,
            title: 'Title',
            subtitle: 'Subtitle',
            items: [
              {
                title: 'Option1',
                description: 'Desc 1'
              },
              {
                title: 'Option2',
                description: 'Desc 2'
              },
            ],
            state_translation: {
              rails_flags: {
                menu_card_id: {
                  Option1: { true => '', false => '--skip-option1' },
                  Option2: { true => '', false => '--skip-option2' }
                }
              }
            },
            initial_state: {
              rails_flags: {
                menu_card_id: {
                  Option1: nil,
                  Option2: nil
                }
              }
            }
          }
        end

        def test_render_title_and_subtitle_for_checkbox_menu_card_component
          render_inline(Main::MenuCard::Checkbox::Component.new(@component_setup))

          assert_text('Title')
          assert_text('Subtitle')
        end

        def test_render_row_title_and_description_for_checkbox_menu_card_component
          render_inline(Main::MenuCard::Checkbox::Component.new(@component_setup))

          assert_text('Option1')
          assert_text('Desc 1')
          assert_text('Option2')
          assert_text('Desc 2')
        end

        def test_only_first_item_checked_for_checkbox_card_component
          @component_setup[:initial_state] = {
            rails_flags: {
              menu_card_id: {
                Option1: true,
                Option2: false
              }
            }
          }

          render_inline(Main::MenuCard::Checkbox::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='Option1' and @checked]")
          assert_selector(:xpath, "//input[@id='Option2' and not(@checked)]")
        end
        
        
        def test_only_second_item_checked_for_checkbox_card_component
          @component_setup[:initial_state] = {
            rails_flags: {
              menu_card_id: {
                Option1: false,
                Option2: true
              }
            }
          }

          render_inline(Main::MenuCard::Checkbox::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='Option1' and not(@checked)]")
          assert_selector(:xpath, "//input[@id='Option2' and @checked]")
        end
        
        def test_both_items_checked_for_checkbox_card_component
          @component_setup[:initial_state] = {
            rails_flags: {
              menu_card_id: {
                Option1: true,
                Option2: true
              }
            }
          }

          render_inline(Main::MenuCard::Checkbox::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='Option1' and @checked]")
          assert_selector(:xpath, "//input[@id='Option2' and @checked]")
        end
        
        def test_none_of_the_items_checked_for_checkbox_card_component
          @component_setup[:initial_state] = {
            rails_flags: {
              menu_card_id: {
                Option1: false,
                Option2: false
              }
            }
          }

          render_inline(Main::MenuCard::Checkbox::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='Option1' and not(@checked)]")
          assert_selector(:xpath, "//input[@id='Option2' and not(@checked)]")
        end
      end
    end
  end
end
