require "test_helper"

class PushRepoJobTest < ActiveJob::TestCase
  test "methods pushing repo to Github are called" do
    verification_run = admin_verification_runs(:pushing_repo_run)

    RecreateRepository.any_instance.expects(:perform)

    command = "echo 'any command that can be successfully executed, \
                     so that AutomatedVerificationStep#perform \
                     returns :success'"

    PushRailsAppVerificationStep.any_instance.expects(:full_command).returns(command)

    PushRepoJob.perform_now(verification_run.id)
    verification_run.reload

    assert_equal "running_ci", verification_run.state
  end
end
