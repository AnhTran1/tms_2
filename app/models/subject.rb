class Subject < ActiveRecord::Base
  has_many :trainee_subjects
  has_many :course_subjects
  has_many :tasks,  dependent: :destroy
  validates :subject_name, presence: true, length: {maximum: 70}
  validates :description, presence: true
  accepts_nested_attributes_for :tasks, allow_destroy: true
end
