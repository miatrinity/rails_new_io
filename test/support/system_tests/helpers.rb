# frozen_string_literal: true

module SystemTestHelpers
  def click_item_by(html_id:)
    find("##{html_id}").click
  end
end
