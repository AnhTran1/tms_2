class CourseSubjectsController < ApplicationController
  

  def show
  end

  private

    def load_object
      @course = Course.find params[:course_id]
      @course_subject = @course.course_subjects.find params[:id]
    end
end