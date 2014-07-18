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

  def new
    @course = Course.new
    @subjects = Subject.all
    @subjects.each do |subject|
      @course.course_subjects.build subject_id: subject.id
    end
  end
    
  def edit
  	@course = Course.find params[:id]
    (Subject.all - @course.subjects).each do |subject|
      @course.course_subjects.build subject: subject
    end
  end

  def update
    @course = Course.find params[:id]
    if params[:commit].to_s == "Start"
    end

    if @course.update_attributes course_params
      flash[:success] = "Course updated!"
      redirect_to supervisors_course_url @course
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
    Course.find(params[:id]).destroy
    flash[:success] = "Course destroyed."
    redirect_to supervisors_courses_url
  end
  private
    def course_params
      params.require(:course).permit(:course_name, :course_descrition)
    end
  
end
