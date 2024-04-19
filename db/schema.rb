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

ActiveRecord::Schema.define(version: 2023_11_15_013805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "subject_id"
    t.date "attendance_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descripcion"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_attendances_on_course_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
    t.index ["subject_id"], name: "index_attendances_on_subject_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_subjects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.date "enrollment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "grades", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "subject_id"
    t.string "grade_type"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value_max"
    t.index ["student_id"], name: "index_grades_on_student_id"
    t.index ["subject_id"], name: "index_grades_on_subject_id"
  end

  create_table "new_s", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "identification_number"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "address"
    t.string "status"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_students_on_course_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_subjects_on_course_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "identification_number"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "address"
    t.string "status"
    t.string "email"
    t.string "profession"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendances", "courses"
  add_foreign_key "attendances", "students"
  add_foreign_key "attendances", "subjects"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "students"
  add_foreign_key "grades", "students"
  add_foreign_key "grades", "subjects"
  add_foreign_key "students", "courses"
  add_foreign_key "subjects", "courses"
  add_foreign_key "subjects", "teachers"
end
