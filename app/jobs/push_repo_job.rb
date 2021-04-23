class PushRepoJob < ApplicationJob
  queue_as :default

  def perform(verification_run_id)
    verification_run = Admin::VerificationRun.find(verification_run_id)

    perform_status = PushRailsAppVerificationStep.new.perform(verification_run: verification_run)

    verification_run.verify! if perform_status == :success
  end
end
