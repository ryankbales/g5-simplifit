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

ActiveRecord::Schema.define(version: 20150130205951) do

  create_table "departments", force: true do |t|
    t.string "name"
  end

  create_table "g5_authenticatable_users", force: true do |t|
    t.string   "email",              default: "",   null: false
    t.string   "provider",           default: "g5", null: false
    t.string   "uid",                               null: false
    t.string   "g5_access_token"
    t.integer  "sign_in_count",      default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "g5_authenticatable_users", ["email"], name: "index_g5_authenticatable_users_on_email", unique: true
  add_index "g5_authenticatable_users", ["provider", "uid"], name: "index_g5_authenticatable_users_on_provider_and_uid", unique: true

  create_table "grand_prize_winners", force: true do |t|
    t.integer  "simplifit_user_id"
    t.datetime "created_at"
  end

  create_table "raffles", force: true do |t|
    t.datetime "created_at"
  end

  create_table "simplifit_users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "gender"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_raffle_winners", force: true do |t|
    t.integer "simplifit_user_id"
    t.integer "raffle_id"
  end

  create_table "user_workouts", force: true do |t|
    t.integer "simplifit_user_id"
    t.integer "workout_id"
  end

  create_table "workouts", force: true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.integer  "duration"
  end

end
