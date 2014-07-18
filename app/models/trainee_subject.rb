class TraineeSubject < ActiveRecord::Base
  belongs_to :trainee
  belongs_to :subject
  belongs_to :enroll
  has_many :assigned_tasks
  validates :subject_id,presence:true 
  validates :trainee_id,presence:true
  validates :status, presence:true 
  validates :enroll_id, presence:true
end
