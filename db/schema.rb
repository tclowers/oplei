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

ActiveRecord::Schema.define(version: 20131127092002) do

  create_table "exams", force: true do |t|
    t.integer  "user_id"
    t.datetime "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exams", ["user_id"], name: "index_exams_on_user_id", using: :btree

  create_table "facts", force: true do |t|
    t.string   "question"
    t.string   "answer"
    t.string   "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facts", ["question"], name: "index_facts_on_question", unique: true, using: :btree

  create_table "problems", force: true do |t|
    t.integer  "exam_id"
    t.integer  "fact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "exam_id"
    t.integer  "fact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["exam_id", "fact_id"], name: "index_questions_on_exam_id_and_fact_id", unique: true, using: :btree
  add_index "questions", ["exam_id"], name: "index_questions_on_exam_id", using: :btree
  add_index "questions", ["fact_id"], name: "index_questions_on_fact_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
