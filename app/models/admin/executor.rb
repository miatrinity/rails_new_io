module Admin
  class Executor
    Response = Struct.new(:out, :err, :start_time, :finish_time, :status)

    class << self
      def run(app_recipe:)
        @app_recipe = app_recipe

        start_time = Time.current

        begin
          out, err = TTY::Command.new.run(full_command)
          status = "SUCCESS"
        rescue TTY::Command::ExitError
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

      def app_name
        @app_recipe.title.gsub(/\W/, "_")
      end

      def full_command
        ERB.new(Rails.configuration.rails_new_command_template).result(binding)
      end
    end
  end
end
