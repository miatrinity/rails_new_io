class SetUpCiFilesJob < ApplicationJob
  queue_as :default

  def perform(verification_run_id)
    verification_run = Admin::VerificationRun.find(verification_run_id)

    perform_status = SetupCiFilesVerificationStep.new.perform(verification_run: verification_run)

    verification_run.push_repo! if perform_status == :success
  end
end
