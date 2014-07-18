class StaticPagesController < ApplicationController
  def home
    if signed_in?
    @enrolls = current_trainee.enrolls
    @trainee_subjects = current_trainee.trainee_subjects
    @assigned_tasks = current_trainee.assigned_tasks
    else
    end 
  end

  def help
  end

  def about
  end

  def contact
  end
end
