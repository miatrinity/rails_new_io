# frozen_string_literal: true

module SystemTestHelpers
  def click_item_by(html_id:)
    find("##{html_id}").click
  end

  def assert_command_line_equals(expected_command_line_output)
    command_line_output = page.find(:xpath, "//p[@id='rails-new-output-text']").text

    assert_equal command_line_output.squish, expected_command_line_output
  end
end
