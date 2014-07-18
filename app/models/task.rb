class Task < ActiveRecord::Base
  has_many :assigned_tasks
  belongs_to :subject
  validates :task_description,presence: true
end
