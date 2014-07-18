class CreateTraineeSubjects < ActiveRecord::Migration
  def change
    create_table :trainee_subjects do |t|
      t.integer :enroll_id
      t.integer :trainee_id
      t.integer :subject_id
      t.string :status
      t.timestamp :timecomplete

      t.timestamps
    end
  end
end
