require "test_helper"

Capybara.server = :puma, {Silent: true}

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers
  include RailsNewIo::SystemTestHelpers
  include RailsNewIo::CustomAsserts

  if ENV["SHOW_BROWSER"]
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  else
    driven_by :selenium, using: :headless_chrome, screen_size: [1920, 1080]
  end
end
