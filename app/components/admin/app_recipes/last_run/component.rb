module Admin
  module AppRecipes
    module LastRun
      class Component < ViewComponent::Base
        def initialize(app_recipe:)
          @app_recipe = app_recipe
        end

        def time_passed_since_last_run
          if @app_recipe.verification_runs.any?
            "#{time_ago_in_words(@app_recipe.verification_runs.last.finished_at)} ago"
          else
            "No Runs - Yet!"
          end
        end

        def status_of_last_run
          if @app_recipe.verification_runs.any?
            @app_recipe.verification_runs.last.status
          else
            ""
          end
        end

        def last_run_status_color
          case status_of_last_run
            when "SUCCESS" then "bg-green-800 text-green-100"
            when "ERROR" then "bg-red-800 text-red-100"
          end
        end

        def repo_name
          "miatrinity/#{@app_recipe.app_name}"
        end

        def repo_url
          "https://github.com/#{repo_name}"
        end
      end
    end
  end
end
