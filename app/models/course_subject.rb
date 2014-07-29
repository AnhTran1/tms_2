class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject 
  validates :subject_id,presence:true
end
