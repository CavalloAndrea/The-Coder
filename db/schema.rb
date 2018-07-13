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

ActiveRecord::Schema.define(version: 20180713073058) do

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.text "titolo"
    t.text "linguaggio"
    t.text "esercizio"
    t.text "soluzione"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_problems_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "titolo"
    t.string "d1"
    t.string "d2"
    t.string "d3"
    t.string "d4"
    t.string "d5"
    t.string "g1"
    t.string "g2"
    t.string "g3"
    t.string "g4"
    t.string "g5"
    t.string "r1_1"
    t.string "r1_2"
    t.string "r1_3"
    t.string "r2_1"
    t.string "r2_2"
    t.string "r2_3"
    t.string "r3_1"
    t.string "r3_2"
    t.string "r3_3"
    t.string "r4_1"
    t.string "r4_2"
    t.string "r4_3"
    t.string "r5_1"
    t.string "r5_2"
    t.string "r5_3"
    t.integer "tutorial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "next"
    t.index ["tutorial_id"], name: "index_quizzes_on_tutorial_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "sites", force: :cascade do |t|
    t.boolean "sospeso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutorials", force: :cascade do |t|
    t.text "titolo"
    t.text "lezione"
    t.text "linguaggio"
    t.text "quiz"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "next"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "nickname"
    t.boolean "admin"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "eta"
    t.string "sesso"
    t.string "istruzione"
    t.string "linguaggi"
    t.string "uid"
    t.string "provider"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean "privato"
    t.integer "java", default: 10
    t.integer "python", default: 20
    t.integer "c", default: 0
    t.integer "assembly", default: 30
    t.integer "sql", default: 40
    t.integer "html", default: 50
    t.integer "javascript", default: 70
    t.integer "css", default: 60
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
