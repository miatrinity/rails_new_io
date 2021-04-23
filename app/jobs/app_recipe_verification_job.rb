class AppRecipeVerificationJob < ApplicationJob
  queue_as :default

  def perform(app_recipe_id, verification_run_id)
    setup_job_scope
    @app_recipe.verify!(verification_run: @verification_run)

    # start_time = Time.current

    # begin
    # out = "Worked like now!"
    # err = "No Errors yeah!"
    # status = "SUCCESS"
    # rescue
    #   out = "Failed to generate new rails application :-("
    #   err = $!
    #   status = "ERROR"
    # end

    # finish_time = Time.current
  end

  private

  def setup_job_scope
    @app_recipe = AppRecipe.find(app_recipe_id)
    @verification_run = VerificationRun.find(verification_run_id)
  end
end
