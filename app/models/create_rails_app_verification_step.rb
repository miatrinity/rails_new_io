class CreateRailsAppVerificationStep < AutomatedVerificationStep
  def command
    sleep 1
    # full_command(Rails.configuration.rails_new_command_template)
    "echo 'Creating Rails app like now'"
  end

  protected

  def rails_new_command
    if Rails.env.test?
      "echo #{app_name} #{@app_recipe.instructions}"
    else
      "rails new #{app_name} #{@app_recipe.instructions}"
    end
  end
end
