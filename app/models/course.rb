class Course < ActiveRecord::Base
  has_many :subjects, through: :course_subjects
  has_many :enrolls
  has_many :course_subjects, dependent: :destroy
  has_many :managing_courses, dependent: :destroy
  validates :description, presence: true
  validates :course_name, presence: true
   accepts_nested_attributes_for :course_subjects ,allow_destroy: true 
end