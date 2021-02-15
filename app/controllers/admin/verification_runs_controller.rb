class Admin::VerificationRunsController < ApplicationController
  def create
    build_verification_run
    save_verification_run
  end

  def show
    @verification_run = VerificationRun.find(params[:id])
  end

  private

  def build_verification_run
    @verification_run ||= verification_run_scope.build
    @verification_run.attributes = verification_run_params
  end

  def verification_run_scope
    load_app_recipe
    @app_recipe.verification_runs
  end

  def load_app_recipe
    @app_recipe ||= app_recipe_scope.find(params[:app_recipe_id])
  end

  def app_recipe_scope
    AppRecipe
  end

  def verification_run_params
    run_result = Admin::Executor.run(app_recipe: @app_recipe)

    {
      status: run_result.status,
      duration: (run_result.finish_time - run_result.start_time).to_i,
      finished_at: run_result.finish_time,
      output_message: run_result.out.gsub("\n", "<br>"),
      error_message: run_result.err.gsub("\n", "<br>")
    }
  end

  def save_verification_run
    @verification_run.save

    redirect_to admin_app_recipe_verification_run_path(@app_recipe, @verification_run)
  end
end
