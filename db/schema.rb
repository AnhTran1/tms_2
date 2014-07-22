# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140721033552) do

  create_table "assigned_tasks", force: true do |t|
    t.integer  "trainee_id"
    t.integer  "task_id"
    t.string   "status"
    t.datetime "timecomplete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_subjects", force: true do |t|
    t.integer  "subject_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "course_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrolls", force: true do |t|
    t.integer  "trainee_id"
    t.integer  "course_id"
    t.string   "status"
    t.datetime "timecomplete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managing_courses", force: true do |t|
    t.integer  "supervisor_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_tasks", force: true do |t|
    t.integer  "subject_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "subject_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supervisors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "supervisors", ["remember_token"], name: "index_supervisors_on_remember_token"

  create_table "tasks", force: true do |t|
    t.text     "task_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainee_subjects", force: true do |t|
    t.integer  "trainee_id"
    t.integer  "subject_id"
    t.string   "status"
    t.datetime "timecomplete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "trainees", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supervisor",      default: 0
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "trainees", ["remember_token"], name: "index_trainees_on_remember_token"

end
