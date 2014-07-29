class Supervisors::SubjectsController < ApplicationController
  before_filter :signed_in_trainee
  before_filter :supervisor_trainee

  def index
    @subjects = Subject.order(:subject_name)
  end

  def show
    @subject = Subject.find params[:id]
    @tasks = @subject.tasks
  end

  def new
    @subject = Subject.new
   4.times do
      task = @subject.tasks.build
    end
    
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Subject created!"
      redirect_to supervisors_subjects_url
    else
      render 'new'
    end
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update       
    @subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      flash[:success] = "Profile updated"
      redirect_to supervisors_subject_path(@subject)
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find params[:id]
    @subject.destroy
    flash[:success] = "Deleted!"
    redirect_to supervisors_subjects_url
  end

  private
    def subject_params
      params.require(:subject).permit(:subject_name, :description, 
        tasks_attributes:[:id, :subject_id, :task_description])
    end

end
