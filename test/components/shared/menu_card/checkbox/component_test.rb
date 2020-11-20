require 'view_component/test_case'

module Shared
  module MenuCard
    module Checkbox
      class ComponentTest < ViewComponent::TestCase
        def setup
          @component_setup = {
            menu_card_id: :main_tab_rails_flags_menu_card_id,
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
            card_state_translation: {
              Option1: { true => '', false => '--skip-option1' },
              Option2: { true => '', false => '--skip-option2' }
            },
            menu_card_in_all_states: {
              Option1: { base_state1: true, base_state2: false},
              Option2: { base_state1: false, base_state2: true}
            },
            menu_card_in_a_specific_state: {
              Option1: nil,
              Option2: nil
            }
          }
        end

        def test_render_title_and_subtitle_for_checkbox_menu_card_component
          render_inline(Shared::MenuCard::Checkbox::Component.new(@component_setup))

          assert_text('Title')
          assert_text('Subtitle')
        end

        def test_render_row_title_and_description_for_checkbox_menu_card_component
          render_inline(Shared::MenuCard::Checkbox::Component.new(@component_setup))

          assert_text('Option1')
          assert_text('Desc 1')
          assert_text('Option2')
          assert_text('Desc 2')
        end

        def test_only_first_item_checked_for_checkbox_card_component
          @component_setup[:menu_card_in_a_specific_state] = {
            Option1: true,
            Option2: false
          }

          render_inline(Shared::MenuCard::Checkbox::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option1' and @checked]")
          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option2' and not(@checked)]")
        end

        def test_only_second_item_checked_for_checkbox_card_component
          @component_setup[:menu_card_in_a_specific_state] = {
            Option1: false,
            Option2: true
          }

          render_inline(Shared::MenuCard::Checkbox::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option1' and not(@checked)]")
          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option2' and @checked]")
        end

        def test_both_items_checked_for_checkbox_card_component
          @component_setup[:menu_card_in_a_specific_state] = {
            Option1: true,
            Option2: true
          }

          render_inline(Shared::MenuCard::Checkbox::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option1' and @checked]")
          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option2' and @checked]")
        end

        def test_none_of_the_items_checked_for_checkbox_card_component
          @component_setup[:menu_card_in_a_specific_state] = {
            Option1: false,
            Option2: false
          }

          render_inline(Shared::MenuCard::Checkbox::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option1' and not(@checked)]")
          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option2' and not(@checked)]")
        end

        def test_html_data_attributes_are_rendered_correctly
          @component_setup[:menu_card_in_a_specific_state] = {
            Option1: true,
            Option2: false
          }

          render_inline(Shared::MenuCard::Checkbox::Component.new(@component_setup))

          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option1' and @data-base-state1='true' and @data-base-state2='false']")
          assert_selector(:xpath, "//input[@id='main-tab-rails-flags-menu-card-id-option2' and @data-base-state1='false' and @data-base-state2='true']")
        end
      end
    end
  end
end
