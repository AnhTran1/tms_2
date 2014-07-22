class CreateTrainees < ActiveRecord::Migration
  def change
    create_table :trainees do |t|
      t.string :name
      t.string :email
      t.integer :supervisor, default: 0
      t.timestamps
    end
  end
end
