class AppRecipe < ApplicationRecord
  has_many :verification_runs, dependent: :destroy
end
