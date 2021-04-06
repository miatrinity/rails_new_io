class SetupCiFilesVerificationStep < AutomatedVerificationStep
  def command
    sleep 2
    # Rails.configuration.setup_ci_files_command_template
    "echo 'I am setting up the Majom CI files right now!'"
  end
end
