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
      end
    end
  end
end
