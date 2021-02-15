module Admin
  class Executor
    Response = Struct.new(:out, :err, :start_time, :finish_time, :status)

    class << self
      def run(app_recipe:)
        @app_recipe = app_recipe

        start_time = Time.current

        out, err = TTY::Command.new.run(full_command)

        finish_time = Time.current

        # TODO...errr
        status = "SUCCESS"

        Response.new(out, err, start_time, finish_time, status)
      end

      private

      def rails_new_command
        # "rails new #{app_name} #{@app_recipe.instructions}"
        "echo #{app_name} #{@app_recipe.instructions}"
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
