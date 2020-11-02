require 'view_component/test_case'

class ComponentTest < ViewComponent::TestCase
  def setup
    @component_setup = {
      title: 'Title',
      subtitle: 'Subtitle',
      items: [
        {
          title: 'DB1',
          description: 'Desc 1',
        },
        {
          title: 'DB2',
          description: 'Desc 2',
        },
       ],
       state_translation: {
        database_choice: {
          DB1: { true => '', false => '' },
          DB2: { true => '-d db2', false => '' },
        }
      },
      initial_state: {
        database_choice: {
          DB1: nil,
          DB2: nil
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

    assert_text('DB1')
    assert_text('Desc 1')
    assert_text('DB2')
    assert_text('Desc 2')
  end

  def test_first_item_checked_for_radio_button_menu_card_component
    @component_setup[:initial_state] = {
      database_choice: {
        DB1: true,
        DB2: false
      }
    }

    render_inline(Main::MenuCard::RadioButton::Component.new(@component_setup))

    assert_selector(:xpath, "//input[@id='DB1' and @checked]")
  end

  def test_second_item_checked_for_radio_button_menu_card_component
    @component_setup[:initial_state] = {
      database_choice: {
        DB1: false,
        DB2: true
      }
    }

    render_inline(Main::MenuCard::RadioButton::Component.new(@component_setup))

    assert_selector(:xpath, "//input[@id='DB2' and @checked]")
  end
end
