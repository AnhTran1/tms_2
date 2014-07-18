# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
trainee_list = [
["Nguyen Van M","nguyenvanM@gmail.com","123456","123456"],
["Nguyen Van N","nguyenvanN@gmail.com","123456","123456"],
["Nguyen Van D","nguyenvand@gmail.com","123456","123456"],
["Nguyen Van E","nguyenvane@gmail.com","123456","123456"]
]
trainee_list.each do |trainee|
  Trainee.create( :name=>trainee[0], :email=>trainee[1], :password=>trainee[2], :password_confirmation=>trainee[3], supervisor: 0)
end
supervisor_list = [["Nguyen M","nguyenM@gmail.com","123456","123456"]]

Trainee.create(name: "Nguyen M", email: "nguyenM@gmail.com", password: "123456", password_confirmation: "123456", supervisor: 1)

#Trainee.create(name: 'Germany', email: "Nguyen Van A", password: "123456")
#Trainee.create(name: 'Germany1', email: "Nguyen Van A1", password: "123456")
#Trainee.create(name: 'Germany2', email: "Nguyen Van A2", password: "123456")
#Trainee.create(name: 'Germany3', email: "Nguyen Van A3", password: "123456")
#Trainee.create(name: 'Germany4', email: "Nguyen Van A4", password: "123456")
course_list=[["Course K5434T", "The MySQL development project has made its source code available under the terms of the GNU General Public License, as well as under a variety of proprietary agreements. MySQL was owned and sponsored by a single for-profit firm, the Swedish company MySQL AB, now owned by Oracle Corporation"]]
course_list.each do |course_name, description|
  Course.create( course_name: course_name, description: description )
end
course_subject_list=[[1,1],[1,2],[1,3],[1,4]]
course_subject_list.each do |course_id,subject_id|
  CourseSubject.create( course_id: course_id, subject_id: subject_id)
end
subject_list=[["Ruby on Rails","The Ruby on Rails Tutorial book and screencast series teach 
  you how to develop and deploy real, industrial-strength web applications with Ruby on Rails, 
  the open-source web framework that powers top websites such as Twitter, Hulu, GitHub, and the Yellow Pages. The Ruby on Rails Tutorial book is available for free online and is available for purchase as an ebook (PDF, EPUB, and MOBI formats). The companion screencast series includes 15 individual lessons (including a N Rails 4.0 supplement) totaling more than 15 hours, with one lesson for each chapter of the Ruby on Rails Tutorial book. The best value is the ebook/screencast bundle, which includes the 2nd edition book, the Rails 
  4.0–compatible version, the 2nd edition screencast series, and the Rails 4.0 supplementary screencasts. "],
["GitHub","The entire Pro Git book, written by Scott Chacon and published by Apress, 
  is available here. All content is licensed under the Creative Commons Attribution Non 
  ommercial Share Alike 3.0 license. Print versions of the book are available on Amazon.com. "],
["YourSQL","MySQL ( MySQL officially, but also called  My Sequel) is (as of March 2014) the worlds second most
 widely used open-source relational database management system (RDBMS)"],["PHP","PHP is a server-side scripting
  language designed for web development but also used as a general-purpose programming language. "]]
subject_list.each do |subject_name, description|
  Subject.create( subject_name: subject_name, description: description )
end
task_list1=[
  ["Skill test 1 : Multiple choice",3],
  ["Skill test 2 : Exercise",3],
  ["Read Progit : Chapter 1",3],
  ["Lecture 1 : Database design",3],
  ["Lecture 2 :Basic SQL",3],
  ["Lecture 3:Question and Answer",3],
  ["Lecture 4: Final Test",3]
]
task_list1.each do |task_description,subject_id|
  Task.create(task_description: task_description,subject_id: subject_id)
end
enroll_list = [[1,1,"N"],[3,1,"N"]]
enroll_list.each do |trainee_id,course_id,status|
  Enroll.create(trainee_id: trainee_id,course_id: course_id,status: status)  
end
trainee_subject_list = [[1,1,"N",1],[1,2,"N",1],[1,3,"N",1],[1,4,"N",1],[3,1,"N",1],[3,2,"N",1],[3,3,"N",1],[3,4,"N",1]]
trainee_subject_list.each do |trainee_id,subject_id,status,enroll_id|
  TraineeSubject.create(trainee_id:trainee_id,subject_id:subject_id,status:status,enroll_id: enroll_id)
end
trainee_task_list = [[1,1,"F",3],[1,2,"N",3],[1,3,"N",3],[1,4,"N",3],[1,5,"N",3],[1,6,"N",3],[1,7,"N",3],[3,1,"F",3],[3,2,"F",3],[3,3,"F",3],[3,4,"N",3],[3,5,"N",3],[3,6,"N",3],[3,7,"N",3]]
trainee_task_list.each do |trainee_id,task_id,status,trainee_subject_id|
  AssignedTask.create(trainee_id:trainee_id,task_id:task_id,status:status,trainee_subject_id: trainee_subject_id)
end
