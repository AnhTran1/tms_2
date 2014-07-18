class SubjectsController < ApplicationController
  before_action :signed_in_trainee
  before_action :supervisor_trainee
  def show
    @subject = Subject.find params[:id]
    @assigned_task_list = current_trainee.assigned_tasks
    @assigned_task_list.each do |assigned_task|
      if (assigned_task.task.subject_id != @subject.id)
      assigned_task.destroy
      else 
      end
    end
    @trainee_subject = @subject.trainee_subjects.find_by(trainee_id: current_trainee.id)
  end
end
