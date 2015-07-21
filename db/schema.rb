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

ActiveRecord::Schema.define(version: 20140613164953) do

  create_table "experts", force: :cascade do |t|
    t.string   "handle",            limit: 255
    t.integer  "tweet_category_id", limit: 4
    t.integer  "sequence_id",       limit: 4
    t.integer  "user_id",           limit: 4
    t.integer  "is_active",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sinces", force: :cascade do |t|
    t.string   "since_value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweet_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
  end

  add_index "tweet_categories", ["slug"], name: "index_tweet_categories_on_slug", unique: true, using: :btree

  create_table "tweets", force: :cascade do |t|
    t.string   "handle",              limit: 255
    t.integer  "tweet_category_id",   limit: 4
    t.integer  "sequence_id",         limit: 4
    t.string   "tweet_text",          limit: 300
    t.integer  "is_retweet",          limit: 4,   default: 0
    t.datetime "tweet_created_dt"
    t.integer  "has_link",            limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "has_image",           limit: 4,   default: 0
    t.integer  "is_reply",            limit: 4,   default: 0
    t.string   "reply_handle",        limit: 255
    t.integer  "has_hashtags",        limit: 4
    t.string   "hashtags",            limit: 255
    t.integer  "has_user_mention",    limit: 4
    t.string   "user_mention_handle", limit: 255
    t.string   "geo",                 limit: 255
    t.integer  "is_sensitive",        limit: 4,   default: 0
    t.string   "user_location",       limit: 255
    t.string   "tweet_embed",         limit: 786
    t.string   "tweet_id",            limit: 255
    t.string   "language",            limit: 255, default: "en"
  end

  add_index "tweets", ["tweet_category_id"], name: "index_tweets_on_tweet_category_id", using: :btree

  create_table "waitlists", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
