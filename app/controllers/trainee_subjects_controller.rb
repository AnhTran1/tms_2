class TraineeSubjectsController < ApplicationController

  before_action :correct_trainee

  def edit
  end
  
  def update
    if params[:commit] == "Start"
      unless @trainee_subject.started?
          @trainee_subject.subject.tasks.each do |task|
          @trainee_subject.trainee_tasks.build(task_id: task.id,
            trainee_id: current_user.id)
        end
        if @trainee_subject.save
          flash[:success] = "This subject is started!"
        else
          flash[:error] = "Started subject error"
        end
      end
    else
      @trainee_subject.update_attributes trainee_subject_params
    end
    render 'edit'
  end

  private
  
    def trainee_subject_params
      params.require(:trainee_subject).permit(:start_at,  
        trainee_tasks_attributes:[:id, :trainee_id, :task_id, :trainee_subject_id, :finish])
    end

   

    def correct_trainee
      if @enrolls.nil?
        flash[:error] = "You not have permit to update this course progress!"
        redirect_to root_url
      end
    end
end