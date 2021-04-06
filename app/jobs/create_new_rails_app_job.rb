class CreateNewRailsAppJob < ApplicationJob
  queue_as :default

  def perform(verification_run_id)
    verification_run = Admin::VerificationRun.find(verification_run_id)

    CreateRailsAppVerificationStep.new.perform(verification_run: verification_run)
    verification_run.set_up_ci_files!
  end
end
