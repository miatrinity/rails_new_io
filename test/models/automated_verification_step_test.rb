require "test_helper"

class TestStep < AutomatedVerificationStep
  def command
    "wrong command"
  end
end

class AutomatedVerificationStepTest < ActiveSupport::TestCase
  test "If there is a wrong command defined in a Step (inheriting from AutomatedVerificationStep), Step#perform returns :failure" do
    verification_run = admin_verification_runs(:starting_run)

    perform_status = TestStep.new.perform(verification_run: verification_run)

    assert_equal :failure, perform_status
  end
end
