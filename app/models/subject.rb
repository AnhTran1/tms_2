class Subject < ActiveRecord::Base
  has_many :trainee_subjects
  has_many :course_subjects
  has_many :tasks
  validates :subject_name, presence: true, length: {maximum: 70}
  validates :subject_name, presence:true
end
