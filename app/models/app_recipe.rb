class AppRecipe < ApplicationRecord
  has_many :verification_runs, dependent: :destroy

  def app_name
    title.gsub(/\W/, "_")
  end
end
