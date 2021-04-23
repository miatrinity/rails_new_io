class AutomatedVerificationStep
  def perform(verification_run:)
    @app_recipe = verification_run.app_recipe
    started_at = Time.current

    begin
      stdout, stderr = TTY::Command.new.run command
      perform_status = :success
    rescue
      stdout = "Failed to generate new rails application :-("
      stderr = $!
      perform_status = :failure
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

    perform_status
  end

  def full_command(command_template)
    ERB.new(command_template).result(binding)
  end
end
