require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "User API token is correctly set when creating a user" do
    user = User.create(email: "mia@miamia.com", password: "password")
    assert user.api_token.is_a?(String)
    assert_equal 36, user.api_token.size
  end
end
