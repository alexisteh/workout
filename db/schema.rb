# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_02_162807) do

  create_table "exercisecats", force: :cascade do |t|
    t.string "name"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.integer "exercisecat_id"
    t.integer "user_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "list_of_equipment"
    t.integer "user_id"
  end

  create_table "seshes", force: :cascade do |t|
    t.datetime "time"
    t.string "goals"
    t.integer "user_id"
    t.integer "gym_id"
  end

  create_table "sessionworkouts", force: :cascade do |t|
    t.integer "sesh_id"
    t.integer "workout_id"
    t.integer "order"
    t.boolean "activated", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
  end

  create_table "workoutexercises", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "exercise_id"
    t.integer "reps"
    t.integer "sets"
    t.integer "duration"
    t.boolean "activated", default: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
  end

end
