class Supervisors::CoursesSubjectsController < ApplicationController

  before_action :correct_trainee


  def show
    @trainee_course = current_trainee.enrolls.find_by_course_id @course.id
  end

  def edit
    @course_subject = @course.course_subjects.find_by_subject_id @subject.id
  end

  def update
    if params[:submit] = "Start"
      @course_subject = @course.course_subjects.find_by_subject_id @subject.id
      @course_subject.update_attributes start_at: Date.today.to_s
    end
     flash[:success] = "Start success!"
    redirect_to edit_supervisors_course_course_subject_path @course, @subject
  end

  private
  
    def load_object
      @course = Course.find params[:course_id]      
      @subject = Subject.find params[:id]
      unless @course.subjects.include? @subject
        flash[:error] = "Subject not belong to this course!"
        redirect_to supervisors_course_url @course
      end
    end

    def correct_trainee
      supervisor_course = current_trainee.supervisor_courses.find_by course_id: @course.id
      if supervisor_course.nil?
        flash[:error] = "You not have permit to update this course progress!"
        redirect_to supervisors_courses_url
      end
    end

    def course_started
      unless @course.started?
        redirect_to supervisors_course_url @course
      end
    end
end