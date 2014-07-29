class StaticPagesController < ApplicationController
  def home
    if signed_in?
      if be_trainee? current_trainee
        @enrolls = current_trainee.enrolls
        @trainee_subjects = current_trainee.trainee_subjects
        @assigned_tasks = current_trainee.assigned_tasks
      else
      end
    end 
  end

  def help
  end

  def about
  end

  def contact
  end
end
