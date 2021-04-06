class PushRepoJob < ApplicationJob
  queue_as :default

  def perform(verification_run_id)
    verification_run = Admin::VerificationRun.find(verification_run_id)

    PushRailsAppVerificationStep.new.perform(verification_run: verification_run)
    verification_run.verify!
  end
end
