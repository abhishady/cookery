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

ActiveRecord::Schema.define(version: 20160317081824) do

  create_table "billings", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.string   "name",       limit: 20
    t.text     "address",    limit: 65535
    t.integer  "contact",    limit: 4
    t.string   "city",       limit: 20
    t.string   "state",      limit: 20
    t.integer  "pincode",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "category_name", limit: 20
    t.string   "dish_name",     limit: 100
    t.text     "method",        limit: 65535
    t.text     "ingredients",   limit: 65535
    t.string   "dish_image",    limit: 30
    t.string   "dish_video",    limit: 30
    t.string   "price",         limit: 20
    t.integer  "rating",        limit: 4
    t.date     "date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "dishes", ["user_id"], name: "index_dishes_on_user_id", using: :btree

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "dish_id",    limit: 4
    t.integer  "quantity",   limit: 4
    t.integer  "price",      limit: 4
    t.integer  "row_total",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "order_details", ["dish_id"], name: "index_order_details_on_dish_id", using: :btree
  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id", using: :btree

  create_table "order_masters", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "no_of_dish", limit: 4
    t.decimal  "total_cost",            precision: 10, scale: 2
    t.string   "mop",        limit: 20
    t.string   "status",     limit: 20
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "order_masters", ["user_id"], name: "index_order_masters_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "dish_id",     limit: 4
    t.integer  "user_id",     limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "reviews", ["dish_id"], name: "index_reviews_on_dish_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "shippings", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.string   "name",       limit: 20
    t.text     "address",    limit: 65535
    t.integer  "contact",    limit: 4
    t.string   "city",       limit: 20
    t.string   "state",      limit: 20
    t.integer  "pincode",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.text     "address",    limit: 65535
    t.string   "contact",    limit: 20
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.string   "email",      limit: 30
    t.string   "password",   limit: 20
    t.boolean  "is_active",             default: false
    t.boolean  "is_admin",              default: false
    t.boolean  "is_staff",              default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

end
