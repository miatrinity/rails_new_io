class CreateVerificationStepRuns < ActiveRecord::Migration[6.1]
  def change
    create_table :verification_step_runs do |t|
      t.text :stdout
      t.text :stderr
      t.datetime :finished_at
      t.integer :duration

      t.references :verification_run, null: false, foreign_key: true

      t.timestamps
    end
  end
end
