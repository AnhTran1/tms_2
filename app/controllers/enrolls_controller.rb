class EnrollsController < ApplicationController
  before_action :signed_in_user
  before_action :be_user
  before_action :correct_trainee, only: [:show, :update]

  def index
  end

  def show
    @enrolls = current_trainee.enrolls.find params[:id]
  end
  
  def update
    trainee = current_trainee
    if params[:commit] == "Start Course"
      enrolls = current_trainee.enrolls.find params[:id]
      enrolls.course.course_subjects.each do |course_subject|
        user_subject = enrolls.trainee_subjects.build(subject_id: course_subject.subject_id,
          course_subject_id: course_subject.id, trainee_id: current_trainee.id)
      end
      if enrolls.save
        flash[:success] = "Trainee course started"
        else
          flash[:error] = "Started subject error"
        end
      redirect_to trainee_enroll_course_url(current_trainee, enrolls)
    end
  end

  private

    def correct_trainee
      enrolls = current_trainee.enrolls.find params[:id]
      if enrolls.nil?
        flash[:error] = "You not have permit in this course!"
        redirect_to root_url
      end
    end
end
