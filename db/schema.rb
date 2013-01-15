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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130112093509) do

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "oauth_token"
    t.string   "picture"
    t.datetime "oauth_expires_at"
    t.string   "gender"
    t.string   "country"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "users", ["name", "id", "email"], :name => "index_users_on_name_and_id_and_email"

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "yt_video_id"
    t.boolean  "is_complete", :default => false
    t.boolean  "public",      :default => true
    t.integer  "user_id"
    t.string   "youtube_url"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "videos", ["title", "public", "user_id"], :name => "index_videos_on_title_and_public_and_user_id"

end
