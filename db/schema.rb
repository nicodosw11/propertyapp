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

ActiveRecord::Schema.define(version: 20171220175547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "deals", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "district"
    t.string   "postcode"
    t.string   "property_type"
    t.string   "occupancy"
    t.text     "amenities_description"
    t.text     "location_transport_description"
    t.integer  "surface"
    t.integer  "nb_rooms"
    t.integer  "nb_bedrooms"
    t.integer  "nb_bathrooms"
    t.boolean  "active"
    t.integer  "funding_goal"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "investments", force: :cascade do |t|
    t.string   "description"
    t.float    "price"
    t.integer  "shares"
    t.integer  "deal_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["deal_id"], name: "index_investments_on_deal_id", using: :btree
    t.index ["user_id"], name: "index_investments_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "deal_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["deal_id"], name: "index_photos_on_deal_id", using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "deal_id"
    t.string   "city"
    t.string   "district"
    t.string   "postcode"
    t.string   "property_type"
    t.string   "occupancy"
    t.text     "amenities_description"
    t.text     "location_transport_description"
    t.integer  "surface"
    t.integer  "nb_rooms"
    t.integer  "nb_bedrooms"
    t.integer  "nb_bathrooms"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["deal_id"], name: "index_properties_on_deal_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "role"
    t.integer  "deal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_roles_on_deal_id", using: :btree
    t.index ["user_id"], name: "index_roles_on_user_id", using: :btree
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "age"
    t.integer  "deal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_tenants_on_deal_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country_of_residence"
    t.boolean  "admin",                  default: false, null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "archived_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "investments", "deals"
  add_foreign_key "investments", "users"
  add_foreign_key "photos", "deals"
  add_foreign_key "properties", "deals"
  add_foreign_key "roles", "deals"
  add_foreign_key "roles", "users"
  add_foreign_key "tenants", "deals"
end
