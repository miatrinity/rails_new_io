class CreateVerificationRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :verification_runs do |t|
      t.string :status
      t.integer :duration
      t.datetime :finished_at
      t.text :output_message, :error_message

      t.timestamps
    end
  end
end
