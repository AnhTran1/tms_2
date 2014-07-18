class CoursesController < ApplicationController
  before_action :signed_in_trainee
 
  def index
    @courses = Course.all
  end
  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects
    @enrolls = @course.enrolls
    @trainee_subjects = []
    @assigned_tasks = []
    @course.course_subjects.each do |course_subject|
      @trainee_subjects.push(TraineeSubject.find_by(subject_id: course_subject.subject_id))
      Task.find_by(subject_id: course_subject.subject_id) do |task|
        @assigned_tasks.push(AssignedTask.find_by(task_id: task.id))
      end
    end
    @activity_log = []
    @enrolls.each do |enroll|
      if enroll.timecomplete != nil 
        @activity_log.push({"description" => "#{enroll.trainee.name} completed #{enroll.course.name}","timecomplete" => enroll.timecomplete})
      else
      end
    end
    @trainee_subjects.each do |trainee_subject|
      if trainee_subject.timecomplete != nil 
        @activity_log.push({"description" => "#{trainee_subject.trainee.name} completed #{trainee_subject.subject.name}","timecomplete" => trainee_subject.timecomplete})
      else
      end
    end
    @assigned_tasks.each do |assigned_task|
      if assigned_task.timecomplete !=nil
        @activity_log.push("description" => "#{assigned_task.trainee.name} completed #{assigned_task.task.task_description}","timecomplete" => assigned_task.timecomplete)
      else
      end
    end
    @activity_log = @activity_log.sort! {|a| a["timecomplete"].to_i}
  end
end
