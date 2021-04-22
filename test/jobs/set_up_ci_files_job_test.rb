require "test_helper"

class SetUpCiFilesJobTest < ActiveJob::TestCase
  def setup
    FileUtils.rm_rf("/tmp/test_app")
    FileUtils.mkdir_p("/tmp/test_app")
  end

  test "that CI files are set up after a test app is created" do
    verification_run = admin_verification_runs(:set_up_ci_files_run)

    Admin::VerificationRun.any_instance.stubs(:push_repo!).returns(:halt)

    SetUpCiFilesJob.perform_now(verification_run.id)

    assert dot_github_folder_is_present, ".github folder is missing"
    assert app_folder_is_present, "app folder is missing!"
  end

  private

  def dot_github_folder_is_present
    File.exist?("/tmp/test_app/.github")
  end

  def app_folder_is_present
    File.exist?("/tmp/test_app/app")
  end  
end
