module Admin
  module AppRecipes
    module LastRun
      class Component < ViewComponent::Base
        delegate :verification_runs, to: :@app_recipe, prefix: false

        def initialize(app_recipe:)
          @app_recipe = app_recipe
        end

        def time_passed_since_last_finished_run
          if any_finished_runs?
            "#{time_ago_in_words(time_of_last_finished_run)} ago"
          else
            "No Finished Runs - Yet!"
          end
        end

        def progression_of_last_run
          if verification_runs.any?
            case verification_runs.most_recently_started.state
              when "finished_with_success" then "SUCCESS"
              when "finished_with_failure" then "ERROR"
              else verification_runs.most_recently_started.state
            end
          else
            ""
          end
        end

        def last_run_progression_color
          case progression_of_last_run
            when /SUCCESS/ then "bg-green-800 text-green-100"
            when /ERROR/ then "bg-red-800 text-red-100"
          end
        end

        def repo_name
          "miatrinity/#{@app_recipe.app_name}"
        end

        def repo_url
          "https://github.com/#{repo_name}"
        end

        private

        def any_finished_runs?
          verification_runs.any? { |vr| vr.finished_at.present? }
        end

        def time_of_last_finished_run
          verification_runs.most_recently_finished.finished_at
        end
      end
    end
  end
end
