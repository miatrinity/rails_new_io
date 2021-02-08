# frozen_string_literal: true

module RailsNewIo
  module CustomAsserts
    def assert_command_line_equals(expected_command_line_output)
      command_line_output = page.find(:xpath, "//p[@id='rails-new-output-text']").text

      assert_equal expected_command_line_output, command_line_output.squish
    end

    def assert_hidden(element_id)
      assert page.find(:xpath, "//*[@id='#{element_id}' and contains(@class,'hidden')]", visible: false)
    end

    def assert_visible(element_id)
      assert page.find(:xpath, "//*[@id='#{element_id}' and not(contains(@class,'hidden'))]")
    end

    def assert_active_rails_byte(element_id)
      assert_selector(
        :xpath,
        "//li[descendant::input[@id='#{element_id}'] and @data-active-rails-byte='true']"
      )
    end

    def refute_active_rails_byte(element_id)
      assert_selector(
        :xpath,
        "//li[descendant::input[@id='#{element_id}'] and @data-active-rails-byte='false']"
      )
    end
  end
end
