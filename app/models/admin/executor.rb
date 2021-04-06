module Admin
  class Executor
    Response = Struct.new(:out, :err, :start_time, :finish_time, :status)

    class << self
      delegate :app_name, to: :@app_recipe, prefix: false

      def run(app_recipe:)
        @app_recipe = app_recipe

        start_time = Time.current

        begin
          @app_recipe.verify!

          # rails_new_out, rails_new_err = TTY::Command.new.run(full_command(Rails.configuration.rails_new_command_template))

          # setup_ci_files_out, setup_ci_files_err = TTY::Command.new.run(full_command(Rails.configuration.setup_ci_files_command_template))

          # github = Github.new oauth_token: Rails.application.credentials.github[:personal_access_token]

          # begin
          #   github.repos.delete user: "miatrinity", repo: app_name
          # rescue Github::Error::NotFound
          #   puts "The repository miatrinity/#{app_name} doesn't exist"
          # end

          # github.repos.create name: app_name

          # push_repo_out, push_repo_err = TTY::Command.new.run(full_command(Rails.configuration.push_repo_command_template))

          # out = <<-OUT
          # =========================
          # Rails New Command Output:
          # =========================
          # #{rails_new_out}

          # ========================
          # CI Files Command Output:
          # ========================
          # #{setup_ci_files_out}

          # =========================
          # Push Repo Command Output:
          # =========================
          # #{push_repo_out}

          # OUT

          # err = <<-ERR
          # =========================
          # Rails New Command Errors:
          # =========================
          # #{rails_new_err}

          # ========================
          # CI Files Command Errors:
          # ========================
          # #{setup_ci_files_err}

          # =========================
          # Push Repo Command Errors:
          # =========================
          # #{push_repo_err}

          # ERR

          out = "Worked like now!"
          err = "No Errors yeah!"
          status = "SUCCESS"
        rescue
          out = "Failed to generate new rails application :-("
          err = $!
          status = "ERROR"
        end

        finish_time = Time.current

        Response.new(out, err, start_time, finish_time, status)
      end

      private

      def rails_new_command
        if Rails.env.test?
          "echo #{app_name} #{@app_recipe.instructions}"
        else
          "rails new #{app_name} #{@app_recipe.instructions}"
        end
      end

      def full_command(command_template)
        ERB.new(command_template).result(binding)
      end
    end
  end
end
