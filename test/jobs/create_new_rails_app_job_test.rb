require "test_helper"

class CreateNewRailsAppJobTest < ActiveJob::TestCase
  test "that a new Rails app is created" do
    verification_run = admin_verification_runs(:creating_new_rails_app_run)

    Admin::VerificationRun.any_instance.stubs(:set_up_ci_files!).returns(:halt)

    CreateNewRailsAppJob.perform_now(verification_run.id)

    assert directory_was_created_recently, "Seems like this app wasn't created recently!"
    assert app_folder_is_present, "App folder is missing!"
  end

  private

  def directory_was_created_recently
    Time.now - File.stat("/tmp/test_app").birthtime < 10
  end

  def app_folder_is_present
    File.exist?("/tmp/test_app/app")
  end
end
