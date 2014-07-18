class CreateAssignedTasks < ActiveRecord::Migration
  def change
    create_table :assigned_tasks do |t|
      t.integer :trainee_subject_id
      t.integer :trainee_id	
      t.integer :task_id
      t.string :status
      t.timestamp :timecomplete

      t.timestamps
    end
  end
end
