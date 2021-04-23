class PushRailsAppVerificationStep < AutomatedVerificationStep
  def command
    RecreateRepository.new(repo_name: @app_recipe.app_name,
                           api_token: @app_recipe.user.api_token).perform

    full_command(Rails.configuration.push_repo_command_template)
  end
end
