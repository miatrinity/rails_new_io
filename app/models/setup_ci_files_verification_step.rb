class SetupCiFilesVerificationStep < AutomatedVerificationStep
  def command
    full_command(Rails.configuration.setup_ci_files_command_template)
  end
end
