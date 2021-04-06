class AutomatedVerificationStep
  def perform(verification_run:)
    started_at = Time.current

    begin
      stdout, stderr = TTY::Command.new.run command
    rescue
      stdout = "Failed to generate new rails application :-("
      stderr = $!
    end

    finished_at = Time.current

    verification_run.verification_step_runs.create(
      stdout: stdout,
      stderr: stderr,
      finished_at: finished_at,
      duration: finished_at - started_at
    )

    puts "=" * 100
    puts self.class
    puts stdout
    puts stderr
    puts "=" * 100

    # if next_verification_step.present?
    #   AppRecipeVerificationStepJob.perform_now(
    #     next_verification_step,
    #     verification_run)
    # end

    # verification_run.update(
    #   status: status,
    #   finished_at: finished_at,
    #   duration: finished_at - verification_run.created_at
    # )
  end

  def full_command
    ERB.new(command_template).result(binding)
  end
end
