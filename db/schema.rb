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

ActiveRecord::Schema.define(version: 20160823093201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.text     "keywords"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",        default: ""
    t.string   "black_image",  default: ""
    t.boolean  "is_accepted",  default: true
    t.string   "category_tag"
    t.string   "white_image"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id", using: :btree

  create_table "discounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "photo",       default: ""
    t.string   "name",        default: ""
    t.integer  "sort_value",  default: 0
    t.float    "sell_price",  default: 0.0
    t.float    "buy_price",   default: 0.0
    t.text     "description", default: ""
    t.integer  "quantity",    default: 0
    t.integer  "location_id"
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "inventory_tiers", force: :cascade do |t|
    t.decimal  "sell_price",   precision: 8, scale: 2, default: 0.0
    t.integer  "tier",                                 default: 1
    t.integer  "inventory_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "location_categories", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "venue_cat_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "locations", force: :cascade do |t|
    t.boolean  "is_table",                                       default: false
    t.boolean  "is_shipping",                                    default: false
    t.string   "city",                                           default: ""
    t.string   "branch_name",                                    default: ""
    t.string   "address",                                        default: ""
    t.string   "post_code",                                      default: ""
    t.string   "country",                                        default: ""
    t.float    "latitude",                                       default: 0.0
    t.float    "longitude",                                      default: 0.0
    t.string   "image",                                          default: ""
    t.string   "email",                                          default: ""
    t.string   "website_address",                                default: ""
    t.string   "phone_no",                                       default: ""
    t.integer  "mon_tier_price",                                 default: 0
    t.integer  "tue_tier_price",                                 default: 0
    t.integer  "wed_tier_price",                                 default: 0
    t.integer  "thu_tier_price",                                 default: 0
    t.integer  "fri_tier_price",                                 default: 0
    t.integer  "sat_tier_price",                                 default: 0
    t.integer  "sun_tier_price",                                 default: 0
    t.integer  "max_delivery_time",                              default: 0
    t.string   "logo"
    t.boolean  "is_order_collection"
    t.string   "second_image"
    t.decimal  "tax_percent",            precision: 4, scale: 2, default: 0.0
    t.decimal  "tips",                   precision: 6, scale: 2, default: 0.0
    t.boolean  "is_room_service",                                default: false
    t.boolean  "is_mobile_order_active",                         default: true
    t.boolean  "is_live",                                        default: false
    t.decimal  "min_spend",              precision: 6, scale: 2, default: 0.0
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "modifiers", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "inventory_id"
    t.float    "buy_price",    default: 0.0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title",                default: ""
    t.text     "terms_and_conditions", default: ""
    t.string   "user_type",            default: ""
    t.string   "offer_url",            default: ""
    t.string   "caption",              default: ""
    t.string   "detail",               default: ""
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.float    "full_price",           default: 0.0
    t.float    "price",                default: 0.0
    t.string   "offer_code",           default: ""
    t.string   "uploaded_image",       default: ""
    t.string   "offer_image",          default: ""
    t.string   "applicable_to",        default: ""
    t.string   "offer_type",           default: ""
    t.integer  "quantity",             default: 0
    t.integer  "beacon_id"
    t.boolean  "special_offer",        default: false
    t.integer  "location_id"
    t.integer  "inventory_id"
    t.text     "applicable_days",      default: [],                 array: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rate_value",    default: 0
    t.integer  "staff_quality", default: 0
    t.integer  "location_id"
    t.integer  "recommended",   default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "service_times", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "day"
    t.time     "from"
    t.time     "to"
    t.integer  "service_type"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_open",      default: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "title",       default: ""
    t.integer  "category_id"
    t.string   "image",       default: ""
    t.string   "black_icon"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "venue_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "blogs"
end
