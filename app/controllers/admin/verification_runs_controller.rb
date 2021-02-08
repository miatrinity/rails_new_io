class Admin::VerificationRunsController < ApplicationController
  def create
    @app_recipe = AppRecipe.find(params[:app_recipe_id])

    before = Time.current

    app_name = "katymasz"

    # rails_new_command = "rails new #{app_name} --template https://www.railsbytes.com/script/XE5s7O"
    rails_new_command = 'echo "SKIPPING"'
    command = <<-CMD
    cd /tmp && \
    export PATH='/usr/local/sbin:/Users/miatrinity/.asdf/shims:/Users/miatrinity/.asdf/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin' && \
    echo '===============================================' && \
    pwd && \
    export BUNDLE_GEMFILE= && \
    bundle env && \
    echo '===============================================' && \
    bundle config && \
    echo '===============================================' && \
    which rails && \
    rails -v && \
    echo '===============================================' && \
    rm -rf #{app_name} && \
    #{rails_new_command} && \
    cd #{app_name} && \
    spring stop
    CMD

    # cmd = TTY::Command.new
    out, err = cmd.run(command)

    # out = "Foo"
    # err = "BARKO"

    @verification_run = VerificationRun.create(
      status: "SUCCESS",
      duration: (Time.current - before).to_i,
      finished_at: Time.current,
      output_message: out.gsub("\n", "<br>"),
      error_message: err.gsub("\n", "<br>"),
      app_recipe: AppRecipe.first
    )

    redirect_to admin_app_recipe_verification_run_path(@app_recipe, @verification_run)
  end

  def show
    @verification_run = VerificationRun.find(params[:id])
  end
end
