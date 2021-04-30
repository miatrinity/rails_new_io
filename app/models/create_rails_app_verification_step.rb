class CreateRailsAppVerificationStep < AutomatedVerificationStep
  def command
    full_command(Rails.configuration.rails_new_command_template)
  end

  protected

  def rails_new_command
    if Rails.env.test?
      "echo #{@app_recipe.app_name} #{@app_recipe.instructions}"
    else
      "rails new #{@app_recipe.app_name} #{@app_recipe.instructions}"
    end
  end
end

