class AppRecipe < ApplicationRecord
  delegate :most_recently_finished, to: :verification_runs
  delegate :most_recently_started, to: :verification_runs

  belongs_to :user
  has_many :verification_runs, dependent: :destroy, class_name: "Admin::VerificationRun"

  before_validation :set_app_name, on: [:create, :update]

  validates_uniqueness_of :app_name, scope: :user_id

  private

  def set_app_name
    self.app_name = name.gsub(/\W/, "_")
  end
end
