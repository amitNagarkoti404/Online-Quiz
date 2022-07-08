# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_01_110834) do

  create_table "colleges", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "college_name"
    t.index ["email"], name: "index_colleges_on_email", unique: true
    t.index ["reset_password_token"], name: "index_colleges_on_reset_password_token", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.integer "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "Dept_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "college_id"
    t.index ["college_id"], name: "index_departments_on_college_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "opt_name"
    t.integer "question_id"
    t.boolean "is_answer", default: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "quest_submissions", force: :cascade do |t|
    t.string "option"
    t.integer "submission_id"
    t.integer "question_id"
    t.index ["submission_id"], name: "index_quest_submissions_on_submission_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "questions"
    t.integer "quiz_id"
    t.integer "score"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "submissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quiz_id"
    t.integer "user_id"
    t.integer "score"
    t.index ["quiz_id"], name: "index_submissions_on_quiz_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

  add_foreign_key "courses", "departments"
  add_foreign_key "options", "questions"
  add_foreign_key "quest_submissions", "submissions"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "submissions", "quizzes"
  add_foreign_key "submissions", "users"
end
