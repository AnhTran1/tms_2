class Supervisors::CoursesController < ApplicationController
  before_filter :signed_in_trainee
  before_filter :supervisor_trainee

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects
    @managing_courses = @course.managing_courses
  end

  def new
    @course = Course.new
    @subjects = Subject.all
    @subjects.each do |subject|
      @course.course_subjects.build subject_id: subject.id
    end  
  end

  def create
    @course = Course.new course_params    
    @course.course_subjects.each do |course_subject|
      if course_subject.subject_id.nil?
        course_subject.destroy
      end
    end
    @course.save!
    flash[:success] = "Course created!"
    redirect_to supervisors_courses_path(@course)
  end

  def edit
    @course = Course.find params[:id]
    (Subject.all - @course.subjects).each do |subject|
      @course.course_subjects.build subject: subject
    end
  end

  def update
    @course = Course.find params[:id]
    if @course.update_attributes course_params
      flash[:success] = "Course updated"
      redirect_to supervisors_course_path(@course)
    else
      render 'edit'
    end
    @course.course_subjects.each do |course_subject|
      if course_subject.subject_id.nil?
        course_subject.destroy
      end
    end
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash[:sucess] = "Course deleted"
    redirect_to supervisors_courses_url
  end

  private
    def course_params
      params.require(:course).permit(:course_name, :description, 
        course_subjects_attributes:[:id, :course_id, :subject_id])
    end

end
