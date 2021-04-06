module Admin
  class VerificationRun < ApplicationRecord
    include AASM

    belongs_to :app_recipe

    has_many :verification_step_runs

    scope :most_recently_started, -> { order("created_at asc").last }
    scope :most_recently_finished, -> { where("finished_at IS NOT NULL").last }

    aasm column: :state do
      state :starting, initial: true
      state :creating_new_rails_app
      state :setting_up_ci_files
      state :pushing_repo
      state :running_ci
      state :finished_with_success
      state :finished_with_failure

      event :create_new_rails_app, after_commit: :schedule_creating_new_rails_app do
        transitions from: :starting, to: :creating_new_rails_app
      end

      event :set_up_ci_files, after_commit: :schedule_setting_up_ci_files do
        transitions from: :creating_new_rails_app, to: :setting_up_ci_files
      end

      event :push_repo, after_commit: :schedule_pushing_repo do
        transitions from: :setting_up_ci_files, to: :pushing_repo
      end

      event :verify do
        transitions from: :pushing_repo, to: :running_ci
      end

      event :finish_with_success, after_commit: :set_finished_at do
        transitions from: :running_ci, to: :finished_with_success
      end

      event :finish_with_failure, after_commit: :set_finished_at do
        transitions from: :running_ci, to: :finished_with_failure
      end
    end

    def schedule_creating_new_rails_app
      puts "Wahoo" * 100
      CreateNewRailsAppJob.perform_now(id)
    end

    def schedule_setting_up_ci_files
      puts "Yuhuu" * 100
      SetUpCiFilesJob.perform_now(id)
    end

    def schedule_pushing_repo
      puts "Bruhu hu" * 100
      PushRepoJob.perform_now(id)
    end

    def set_finished_at
      update(finished_at: Time.now)
    end
  end
end
