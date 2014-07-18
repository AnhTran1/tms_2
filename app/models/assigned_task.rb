class AssignedTask < ActiveRecord::Base
  belongs_to :trainee
  belongs_to :task
  belongs_to :trainee_subject
  validates :status, presence: true
  validates :trainee_id, presence: true
  validates :task_id, presence: true
  validates :trainee_subject_id, presence:true
end
