class ChangeStatusToStateForVerificationRuns < ActiveRecord::Migration[6.1]
  def change
    rename_column :verification_runs, :status, :state
  end
end
