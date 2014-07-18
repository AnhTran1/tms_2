class Enroll < ActiveRecord::Base
  belongs_to :trainee
  belongs_to :course
  has_many :trainee_subjects
  validates :trainee_id, presence:true
  validates :course_id, presence:true
  validates :status, presence:true
end
