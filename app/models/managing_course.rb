class ManagingCourse < ActiveRecord::Base

  belongs_to :course
  belongs_to :trainee

end
