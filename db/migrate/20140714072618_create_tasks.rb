class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :task_description
      t.integer :subject_id

      t.timestamps
    end
  end
end
