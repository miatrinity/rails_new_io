class AppRecipeVerificationStepJob < ApplicationJob
  queue_as :default

  def perform(verification_step, verification_run)
    verification_step.new.perform(verification_run: verification_run)
    # stdout, stderr = TTY::Command.new.run(
    #   full_command(Rails.configuration.rails_new_command_template)
    # )

    # AppRecipeVerificationStepRun.create(stdout: stdout, stderr: stderr)

    # if verification_step.next_step.present?
    #   AppRecipeVerificationStepJob.new.perform verification_step.next_step
    # end
  end

  private

  # def rails_new_command
  #   if Rails.env.test?
  #     "echo #{app_name} #{@app_recipe.instructions}"
  #   else
  #     "rails new #{app_name} #{@app_recipe.instructions}"
  #   end
  # end

  # def full_command(command_template)
  #   ERB.new(command_template).result(binding)
  # end
end
