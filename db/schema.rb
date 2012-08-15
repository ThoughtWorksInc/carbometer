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

ActiveRecord::Schema.define(:version => 20120815010744) do

  create_table "posts", :force => true do |t|
    t.string  "title",                   :null => false
    t.string  "path",    :limit => 1024, :null => false
    t.integer "user_id"
  end

  add_index "posts", ["path"], :name => "index_posts_on_path"
  add_index "posts", ["title"], :name => "index_posts_on_title"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "statistics", :force => true do |t|
    t.integer "post_id"
    t.string  "source",      :null => false
    t.date    "start_date",  :null => false
    t.date    "end_date",    :null => false
    t.integer "visit_count"
  end

  add_index "statistics", ["post_id"], :name => "index_statistics_on_post_id"

  create_table "users", :force => true do |t|
    t.string "name"
  end

  add_index "users", ["name"], :name => "index_users_on_name"

end
