class Supervisors::EnrollsController < ApplicationController

  def update    
    course = Course.find params[:course_id]
    if params[:finish]
      enrolls = course.enrolls.find params[:id]
      enrolls.update_attributes finish: params[:finish]
      flash[:success] = "Accept user #{trainee_course.user.name} finish this course!"
    end
    redirect_to supervisors_course_url(course)
  end

end