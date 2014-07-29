class Supervisors::CoursesController < ApplicationController
  before_filter :signed_in_trainee
  before_filter :supervisor_trainee

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects
  end

  def edit
    @course = Course.find params[:id]
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash[:sucess] = "Course deleted"
    redirect_to supervisors_courses_url
  end
end