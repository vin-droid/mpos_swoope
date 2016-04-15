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

ActiveRecord::Schema.define(version: 20160314093806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_deals", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "expiry"
    t.string   "photo"
    t.integer  "category_id"
    t.text     "deal_location"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "location_id"
    t.integer  "client_id"
    t.boolean  "is_approve",    default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "app_deals", ["category_id"], name: "index_app_deals_on_category_id", using: :btree
  add_index "app_deals", ["client_id"], name: "index_app_deals_on_client_id", using: :btree
  add_index "app_deals", ["location_id"], name: "index_app_deals_on_location_id", using: :btree

  create_table "beacons", force: :cascade do |t|
    t.string   "uuid",            default: ""
    t.string   "business_name",   default: ""
    t.integer  "major",           default: 0
    t.integer  "minor",           default: 0
    t.string   "proximity",       default: ""
    t.string   "beacon_location", default: ""
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "beacons", ["location_id"], name: "index_beacons_on_location_id", using: :btree
  add_index "beacons", ["user_id"], name: "index_beacons_on_user_id", using: :btree

  create_table "business_attachments", force: :cascade do |t|
    t.string   "attachment"
    t.integer  "business_owner_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "business_attachments", ["business_owner_id"], name: "index_business_attachments_on_business_owner_id", using: :btree

  create_table "business_owners", force: :cascade do |t|
    t.text     "name"
    t.boolean  "name_value"
    t.text     "detail"
    t.integer  "merchant_information_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "business_owners", ["merchant_information_id"], name: "index_business_owners_on_merchant_information_id", using: :btree

  create_table "card_payments", force: :cascade do |t|
    t.string   "card_token",  default: ""
    t.string   "card_type",   default: ""
    t.string   "last_digits", default: ""
    t.string   "image",       default: ""
    t.string   "remark",      default: ""
    t.integer  "client_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "card_payments", ["client_id"], name: "index_card_payments_on_client_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title",        default: ""
    t.string   "black_image",  default: ""
    t.integer  "request_id"
    t.boolean  "is_accepted",  default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "category_tag"
    t.string   "white_image"
  end

  add_index "categories", ["request_id"], name: "index_categories_on_request_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name",         default: ""
    t.string   "last_name",          default: ""
    t.string   "dob",                default: "0"
    t.string   "gender",             default: ""
    t.string   "post_code",          default: ""
    t.string   "state",              default: ""
    t.string   "city",               default: ""
    t.string   "street",             default: ""
    t.string   "country",            default: ""
    t.string   "photo",              default: ""
    t.string   "phone_no",           default: ""
    t.text     "category",           default: [],                array: true
    t.float    "latitude",           default: 0.0
    t.float    "longitude",          default: 0.0
    t.boolean  "is_notification_on", default: true
    t.string   "customer_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "subcategory_data",   default: [],                array: true
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.string   "description"
    t.boolean  "read_status",   default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "conversations", ["message_id"], name: "index_conversations_on_message_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "device_type",  default: ""
    t.string   "device_token", default: ""
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "devices", ["owner_type", "owner_id"], name: "index_devices_on_owner_type_and_owner_id", using: :btree

  create_table "discounts", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.float    "percentage_dis"
    t.integer  "user_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "applicable_days",     default: [],                      array: true
    t.integer  "quantity_available",  default: 0
    t.integer  "same_user_purchase",  default: 1000000000
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "description"
    t.text     "redeem_instruction"
    t.text     "t_n_c"
    t.boolean  "is_approve",          default: false
    t.integer  "star_value"
    t.float    "price"
    t.boolean  "is_national_voucher", default: false
    t.integer  "location_id"
    t.string   "brand_name"
  end

  add_index "discounts", ["location_id"], name: "index_discounts_on_location_id", using: :btree
  add_index "discounts", ["user_id"], name: "index_discounts_on_user_id", using: :btree

  create_table "floor_plan_beacons", force: :cascade do |t|
    t.string   "orientation"
    t.string   "center_x"
    t.string   "center_y"
    t.string   "width"
    t.string   "height"
    t.integer  "beacon_id"
    t.integer  "floor_plan_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "floor_plan_beacons", ["beacon_id"], name: "index_floor_plan_beacons_on_beacon_id", using: :btree
  add_index "floor_plan_beacons", ["floor_plan_id"], name: "index_floor_plan_beacons_on_floor_plan_id", using: :btree

  create_table "floor_plan_collections", force: :cascade do |t|
    t.string   "collection_no"
    t.string   "orientation"
    t.string   "center_x"
    t.string   "center_y"
    t.string   "width"
    t.string   "height"
    t.integer  "floor_plan_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "floor_plan_collections", ["floor_plan_id"], name: "index_floor_plan_collections_on_floor_plan_id", using: :btree

  create_table "floor_plan_tables", force: :cascade do |t|
    t.string   "table_no"
    t.string   "table_type"
    t.string   "chair_count"
    t.string   "orientation"
    t.string   "center_x"
    t.string   "center_y"
    t.string   "width"
    t.string   "height"
    t.integer  "floor_plan_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "floor_plan_tables", ["floor_plan_id"], name: "index_floor_plan_tables_on_floor_plan_id", using: :btree

  create_table "floor_plans", force: :cascade do |t|
    t.string   "floor_height"
    t.string   "floor_width"
    t.string   "floor_color"
    t.integer  "location_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "floor_plans", ["location_id"], name: "index_floor_plans_on_location_id", using: :btree

  create_table "home_stats", force: :cascade do |t|
    t.string   "stats_type", default: "{}"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "postion",    default: 0
  end

  add_index "home_stats", ["user_id"], name: "index_home_stats_on_user_id", using: :btree

  create_table "inventories", force: :cascade do |t|
    t.string   "photo",          default: ""
    t.string   "name",           default: ""
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "sort_value",     default: 0
    t.float    "sell_price",     default: 0.0
    t.float    "buy_price",      default: 0.0
    t.text     "description",    default: ""
    t.integer  "quantity",       default: 0
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "inventories", ["category_id"], name: "index_inventories_on_category_id", using: :btree
  add_index "inventories", ["location_id"], name: "index_inventories_on_location_id", using: :btree
  add_index "inventories", ["subcategory_id"], name: "index_inventories_on_subcategory_id", using: :btree
  add_index "inventories", ["user_id"], name: "index_inventories_on_user_id", using: :btree

  create_table "item_ratings", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "rate_value"
    t.boolean  "is_offer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "order_datum_id"
  end

  add_index "item_ratings", ["order_datum_id"], name: "index_item_ratings_on_order_datum_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "offer_id"
    t.boolean  "is_like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["client_id"], name: "index_likes_on_client_id", using: :btree
  add_index "likes", ["offer_id"], name: "index_likes_on_offer_id", using: :btree

  create_table "loc_transaction_fees", force: :cascade do |t|
    t.string   "trans_fee_type"
    t.decimal  "merchant",       precision: 4, scale: 2, default: 0.0
    t.decimal  "user",           precision: 4, scale: 2, default: 0.0
    t.decimal  "total",          precision: 4, scale: 2, default: 0.0
    t.integer  "location_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "loc_transaction_fees", ["location_id"], name: "index_loc_transaction_fees_on_location_id", using: :btree

  create_table "location_categories", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "venue_cat_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "location_categories", ["location_id"], name: "index_location_categories_on_location_id", using: :btree
  add_index "location_categories", ["venue_cat_id"], name: "index_location_categories_on_venue_cat_id", using: :btree

  create_table "location_subcategories", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "subcategory_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "location_subcategories", ["location_id"], name: "index_location_subcategories_on_location_id", using: :btree
  add_index "location_subcategories", ["subcategory_id"], name: "index_location_subcategories_on_subcategory_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "city",                                        default: ""
    t.string   "branch_name",                                 default: ""
    t.string   "address",                                     default: ""
    t.string   "post_code",                                   default: ""
    t.string   "country",                                     default: ""
    t.float    "latitude",                                    default: 0.0
    t.float    "longitude",                                   default: 0.0
    t.string   "image",                                       default: ""
    t.boolean  "is_table",                                    default: false
    t.boolean  "is_shipping",                                 default: false
    t.string   "email",                                       default: ""
    t.string   "website_address",                             default: ""
    t.integer  "user_id"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "phone_no",                                    default: ""
    t.integer  "mon_tier_price",                              default: 0
    t.integer  "tue_tier_price",                              default: 0
    t.integer  "wed_tier_price",                              default: 0
    t.integer  "thu_tier_price",                              default: 0
    t.integer  "fri_tier_price",                              default: 0
    t.integer  "sat_tier_price",                              default: 0
    t.integer  "sun_tier_price",                              default: 0
    t.time     "mon_open_time"
    t.time     "tue_open_time"
    t.time     "wed_open_time"
    t.time     "thu_open_time"
    t.time     "fri_open_time"
    t.time     "sat_open_time"
    t.time     "sun_open_time"
    t.time     "mon_close_time"
    t.time     "tue_close_time"
    t.time     "wed_close_time"
    t.time     "thu_close_time"
    t.time     "fri_close_time"
    t.time     "sat_close_time"
    t.time     "sun_close_time"
    t.integer  "max_delivery_time",                           default: 0
    t.string   "logo"
    t.boolean  "is_order_collection"
    t.string   "second_image"
    t.time     "mon_delivery_from"
    t.time     "tue_delivery_from"
    t.time     "wed_delivery_from"
    t.time     "thu_delivery_from"
    t.time     "fri_delivery_from"
    t.time     "sat_delivery_from"
    t.time     "sun_delivery_from"
    t.time     "mon_delivery_to"
    t.time     "tue_delivery_to"
    t.time     "wed_delivery_to"
    t.time     "thu_delivery_to"
    t.time     "fri_delivery_to"
    t.time     "sat_delivery_to"
    t.time     "sun_delivery_to"
    t.decimal  "tax_percent",         precision: 4, scale: 2, default: 0.0
    t.decimal  "tips",                precision: 6, scale: 2, default: 0.0
    t.string   "venue_category_id",                           default: [],                 array: true
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "logged_times", force: :cascade do |t|
    t.string   "loggable_type"
    t.integer  "loggable_id"
    t.datetime "in_time"
    t.datetime "out_time"
    t.integer  "time_lock",     default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "location_id"
    t.string   "username"
    t.integer  "passcode"
    t.string   "image"
    t.integer  "merchant_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "managers", ["location_id"], name: "index_managers_on_location_id", using: :btree
  add_index "managers", ["merchant_id"], name: "index_managers_on_merchant_id", using: :btree

  create_table "merchant_informations", force: :cascade do |t|
    t.string   "legal_name"
    t.string   "trading_as"
    t.string   "website_url"
    t.string   "legal_representative"
    t.string   "registration_no"
    t.string   "vat_no"
    t.integer  "trading_currency"
    t.text     "registered_address"
    t.string   "post_code"
    t.string   "country"
    t.string   "phone"
    t.string   "email_address"
    t.string   "corporate_url"
    t.text     "shop_urls",                          default: [],              array: true
    t.string   "site_user_login"
    t.string   "site_password"
    t.text     "business_description"
    t.string   "trading_name"
    t.string   "trading_phone_number"
    t.integer  "years_in_bussiness"
    t.string   "commercial_contact_email"
    t.string   "developer_contact_email"
    t.string   "no_of_monthly_card_tx"
    t.string   "min_tx_amount"
    t.string   "max_tx_amount"
    t.string   "avg_tx_amount"
    t.string   "phone_orders_percantage"
    t.string   "online_percantage"
    t.string   "mobile_app_percantage"
    t.string   "previous_processor_name"
    t.string   "current_processor_name"
    t.string   "reason_for_leaving"
    t.string   "account_holder"
    t.string   "bank_name"
    t.text     "bank_address"
    t.string   "bank_contact"
    t.string   "iban"
    t.string   "bic"
    t.text     "authorization_currencies",           default: [],              array: true
    t.string   "account_currency"
    t.string   "proof_of_driving_lincese"
    t.string   "proof_of_trading_address"
    t.string   "license_for_running_business"
    t.string   "license_for_running_business_title"
    t.string   "photo_of_shop_front_premises"
    t.string   "bank_statment_3_months"
    t.integer  "merchant_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "merchant_informations", ["merchant_id"], name: "index_merchant_informations_on_merchant_id", using: :btree

  create_table "merchant_partners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.text     "home_address"
    t.string   "post_code"
    t.string   "country"
    t.string   "passport_number"
    t.string   "proof_of_address"
    t.string   "ownership_in_percentage"
    t.integer  "merchant_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "is_owner",                default: true
    t.boolean  "same_as_owner",           default: false
  end

  add_index "merchant_partners", ["merchant_id"], name: "index_merchant_partners_on_merchant_id", using: :btree

  create_table "merchant_staffs", force: :cascade do |t|
    t.integer  "merchant_id"
    t.integer  "passcode",          default: 0
    t.string   "username"
    t.float    "wages_per_hours",   default: 0.0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "is_active",         default: true
    t.boolean  "add_promotion",     default: false
    t.boolean  "perform_no_sale",   default: true
    t.boolean  "perform_refund",    default: false
    t.boolean  "waste_items",       default: false
    t.boolean  "view_close_orders", default: false
    t.boolean  "see_reports",       default: false
    t.boolean  "abandon_orders",    default: false
    t.integer  "location_id"
  end

  add_index "merchant_staffs", ["location_id"], name: "index_merchant_staffs_on_location_id", using: :btree
  add_index "merchant_staffs", ["merchant_id"], name: "index_merchant_staffs_on_merchant_id", using: :btree

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.integer  "user_id"
    t.string   "country"
    t.string   "state"
    t.string   "street"
    t.string   "city"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "passcode"
    t.boolean  "subscription_status"
    t.boolean  "go_live_status"
    t.string   "transact_member_id"
    t.string   "transact_merchant_secret_key"
    t.string   "paypal_access_token"
    t.string   "paypal_refresh_token"
    t.boolean  "paypal_here_status",           default: false
    t.boolean  "has_transact_account",         default: false
    t.string   "business_name"
    t.string   "terminal_id"
  end

  add_index "merchants", ["user_id"], name: "index_merchants_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.integer  "order_id"
  end

  add_index "messages", ["client_id"], name: "index_messages_on_client_id", using: :btree
  add_index "messages", ["location_id"], name: "index_messages_on_location_id", using: :btree
  add_index "messages", ["order_id"], name: "index_messages_on_order_id", using: :btree

  create_table "modifiers", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "inventory_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "buy_price",    default: 0.0
  end

  add_index "modifiers", ["inventory_id"], name: "index_modifiers_on_inventory_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "notifible_id"
    t.string   "notifible_type"
    t.text     "message"
    t.boolean  "read_status",    default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "notifications", ["client_id"], name: "index_notifications_on_client_id", using: :btree

  create_table "offer_ages", force: :cascade do |t|
    t.integer  "from_age"
    t.integer  "to_age"
    t.integer  "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offer_ages", ["offer_id"], name: "index_offer_ages_on_offer_id", using: :btree

  create_table "offer_beacons", force: :cascade do |t|
    t.integer  "offer_location_id"
    t.integer  "beacon_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "offer_beacons", ["beacon_id"], name: "index_offer_beacons_on_beacon_id", using: :btree
  add_index "offer_beacons", ["offer_location_id"], name: "index_offer_beacons_on_offer_location_id", using: :btree

  create_table "offer_locations", force: :cascade do |t|
    t.integer  "offer_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "offer_locations", ["location_id"], name: "index_offer_locations_on_location_id", using: :btree
  add_index "offer_locations", ["offer_id"], name: "index_offer_locations_on_offer_id", using: :btree

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
    t.string   "qr_image",             default: ""
    t.string   "uploaded_image",       default: ""
    t.string   "offer_image",          default: ""
    t.string   "applicable_to",        default: ""
    t.string   "offer_type",           default: ""
    t.integer  "quantity",             default: 0
    t.integer  "beacon_id"
    t.boolean  "special_offer",        default: false
    t.integer  "location_id"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "inventory_id"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "age_array",            default: [],                 array: true
    t.text     "offer_age",            default: [],                 array: true
  end

  add_index "offers", ["beacon_id"], name: "index_offers_on_beacon_id", using: :btree
  add_index "offers", ["category_id"], name: "index_offers_on_category_id", using: :btree
  add_index "offers", ["inventory_id"], name: "index_offers_on_inventory_id", using: :btree
  add_index "offers", ["location_id"], name: "index_offers_on_location_id", using: :btree
  add_index "offers", ["subcategory_id"], name: "index_offers_on_subcategory_id", using: :btree
  add_index "offers", ["user_id"], name: "index_offers_on_user_id", using: :btree

  create_table "order_data", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "item_name"
    t.string   "photo"
    t.boolean  "is_offer"
    t.integer  "order_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "quantity",       default: 0
    t.integer  "offer_id"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.float    "price",          default: 0.0
  end

  add_index "order_data", ["category_id"], name: "index_order_data_on_category_id", using: :btree
  add_index "order_data", ["offer_id"], name: "index_order_data_on_offer_id", using: :btree
  add_index "order_data", ["order_id"], name: "index_order_data_on_order_id", using: :btree
  add_index "order_data", ["subcategory_id"], name: "index_order_data_on_subcategory_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.integer  "till_id"
    t.datetime "start_time"
    t.string   "status"
    t.integer  "order_id"
    t.integer  "attendee_id"
    t.string   "attendee_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "order_statuses", ["order_id"], name: "index_order_statuses_on_order_id", using: :btree
  add_index "order_statuses", ["till_id"], name: "index_order_statuses_on_till_id", using: :btree

  create_table "ordered_modifiers", force: :cascade do |t|
    t.text     "modifier_ids",    default: [],              array: true
    t.text     "modifier_data",   default: [],              array: true
    t.integer  "order_datum_id"
    t.integer  "inventory_count", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ordered_modifiers", ["order_datum_id"], name: "index_ordered_modifiers_on_order_datum_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "location_id"
    t.integer  "shipping_address_id"
    t.string   "order_for"
    t.float    "total_price"
    t.integer  "total_quantity"
    t.string   "qr_code",                                       default: ""
    t.float    "tips",                                          default: 0.0
    t.float    "service_charge",                                default: 0.0
    t.integer  "table_no"
    t.integer  "pay_id"
    t.string   "transaction_id"
    t.string   "pay_type"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "current_status"
    t.string   "generated_from"
    t.boolean  "payment_status"
    t.decimal  "price_before_discount", precision: 9, scale: 2, default: 0.0
    t.decimal  "total_discount",        precision: 9, scale: 2, default: 0.0
    t.decimal  "price_after_discount",  precision: 9, scale: 2, default: 0.0
    t.decimal  "tax",                   precision: 9, scale: 2, default: 0.0
    t.decimal  "tax_percent",           precision: 4, scale: 2, default: 0.0
    t.float    "delivery_time",                                 default: 0.0
    t.string   "order_type"
    t.string   "order_visible_id"
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id", using: :btree
  add_index "orders", ["location_id"], name: "index_orders_on_location_id", using: :btree
  add_index "orders", ["shipping_address_id"], name: "index_orders_on_shipping_address_id", using: :btree

  create_table "payment_methods", force: :cascade do |t|
    t.string   "monthly_card_volume"
    t.string   "alternate_payment_methods"
    t.string   "amount"
    t.integer  "merchant_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "payment_methods", ["merchant_id"], name: "index_payment_methods_on_merchant_id", using: :btree

  create_table "paypal_payments", force: :cascade do |t|
    t.string   "card_token", default: ""
    t.string   "email",      default: ""
    t.string   "image",      default: ""
    t.string   "remark",     default: ""
    t.integer  "client_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "paypal_payments", ["client_id"], name: "index_paypal_payments_on_client_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "plan_name"
    t.string   "plan_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "point_gains", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "activity"
    t.integer  "related_id"
    t.integer  "used_point",   default: 0
    t.integer  "gained_point", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "point_gains", ["client_id"], name: "index_point_gains_on_client_id", using: :btree

  create_table "purchase_vouchers", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "discount_id"
    t.integer  "voucher_code_id"
    t.boolean  "is_redeem",       default: false
    t.datetime "redeem_date"
    t.integer  "order_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "purchase_vouchers", ["client_id"], name: "index_purchase_vouchers_on_client_id", using: :btree
  add_index "purchase_vouchers", ["discount_id"], name: "index_purchase_vouchers_on_discount_id", using: :btree
  add_index "purchase_vouchers", ["order_id"], name: "index_purchase_vouchers_on_order_id", using: :btree
  add_index "purchase_vouchers", ["voucher_code_id"], name: "index_purchase_vouchers_on_voucher_code_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "rate_value",    default: 0
    t.integer  "staff_quality", default: 0
    t.integer  "location_id"
    t.integer  "client_id"
    t.integer  "order_id"
    t.integer  "recommended",   default: 0
    t.text     "rate_comment"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "ratings", ["client_id"], name: "index_ratings_on_client_id", using: :btree
  add_index "ratings", ["location_id"], name: "index_ratings_on_location_id", using: :btree
  add_index "ratings", ["order_id"], name: "index_ratings_on_order_id", using: :btree

  create_table "referrals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "referral_code"
    t.integer  "target_user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "referrals", ["user_id"], name: "index_referrals_on_user_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "title",       default: ""
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "post_code",   default: ""
    t.string   "city",        default: ""
    t.string   "state",       default: ""
    t.string   "street",      default: ""
    t.boolean  "is_selected", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "shipping_addresses", ["client_id"], name: "index_shipping_addresses_on_client_id", using: :btree

  create_table "sub_admins", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sub_admins", ["user_id"], name: "index_sub_admins_on_user_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "title",       default: ""
    t.integer  "category_id"
    t.string   "image",       default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "black_icon"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "order_no"
    t.string   "checksum"
    t.string   "status"
    t.string   "status_description"
    t.integer  "trackingId"
    t.float    "auth_amount"
    t.float    "capture_ammount"
    t.datetime "next_date"
    t.integer  "merchant_id"
    t.integer  "plan_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "subscription_date"
  end

  add_index "subscriptions", ["merchant_id"], name: "index_subscriptions_on_merchant_id", using: :btree
  add_index "subscriptions", ["plan_id"], name: "index_subscriptions_on_plan_id", using: :btree

  create_table "tills", force: :cascade do |t|
    t.string   "name"
    t.string   "device_token"
    t.integer  "location_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tills", ["location_id"], name: "index_tills_on_location_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "role"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "referral_code"
    t.boolean  "is_block",               default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image"
    t.string   "username"
    t.string   "confirmation_token"
    t.string   "confirmation_sent_at"
    t.string   "confirmed_at"
    t.datetime "deleted_at"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree

  create_table "venue_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "voucher_codes", force: :cascade do |t|
    t.integer  "discount_id"
    t.string   "vo_code"
    t.boolean  "is_purchase", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "voucher_codes", ["discount_id"], name: "index_voucher_codes_on_discount_id", using: :btree

  create_table "wish_lists", force: :cascade do |t|
    t.string   "product_name"
    t.integer  "category_id"
    t.string   "brand_name"
    t.string   "photo"
    t.integer  "client_id"
    t.integer  "radius"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "wish_lists", ["category_id"], name: "index_wish_lists_on_category_id", using: :btree
  add_index "wish_lists", ["client_id"], name: "index_wish_lists_on_client_id", using: :btree

  add_foreign_key "app_deals", "categories"
  add_foreign_key "app_deals", "clients"
  add_foreign_key "app_deals", "locations"
  add_foreign_key "beacons", "locations"
  add_foreign_key "beacons", "users"
  add_foreign_key "business_attachments", "business_owners"
  add_foreign_key "business_owners", "merchant_informations"
  add_foreign_key "card_payments", "clients"
  add_foreign_key "clients", "users"
  add_foreign_key "conversations", "messages"
  add_foreign_key "discounts", "users"
  add_foreign_key "floor_plan_beacons", "beacons"
  add_foreign_key "floor_plan_beacons", "floor_plans"
  add_foreign_key "floor_plan_collections", "floor_plans"
  add_foreign_key "floor_plan_tables", "floor_plans"
  add_foreign_key "floor_plans", "locations"
  add_foreign_key "home_stats", "users"
  add_foreign_key "inventories", "categories"
  add_foreign_key "inventories", "locations"
  add_foreign_key "inventories", "subcategories"
  add_foreign_key "inventories", "users"
  add_foreign_key "likes", "clients"
  add_foreign_key "likes", "offers"
  add_foreign_key "loc_transaction_fees", "locations"
  add_foreign_key "location_categories", "categories", column: "venue_cat_id"
  add_foreign_key "location_categories", "locations"
  add_foreign_key "location_subcategories", "locations"
  add_foreign_key "location_subcategories", "subcategories"
  add_foreign_key "locations", "users"
  add_foreign_key "managers", "locations"
  add_foreign_key "managers", "merchants"
  add_foreign_key "merchant_informations", "merchants"
  add_foreign_key "merchant_partners", "merchants"
  add_foreign_key "merchant_staffs", "locations"
  add_foreign_key "merchant_staffs", "merchants"
  add_foreign_key "merchants", "users"
  add_foreign_key "messages", "clients"
  add_foreign_key "modifiers", "inventories"
  add_foreign_key "notifications", "clients"
  add_foreign_key "offer_ages", "offers"
  add_foreign_key "offer_beacons", "beacons"
  add_foreign_key "offer_beacons", "offer_locations"
  add_foreign_key "offer_locations", "locations"
  add_foreign_key "offer_locations", "offers"
  add_foreign_key "offers", "beacons"
  add_foreign_key "offers", "categories"
  add_foreign_key "offers", "inventories"
  add_foreign_key "offers", "locations"
  add_foreign_key "offers", "subcategories"
  add_foreign_key "offers", "users"
  add_foreign_key "order_data", "orders"
  add_foreign_key "order_statuses", "orders"
  add_foreign_key "order_statuses", "tills"
  add_foreign_key "ordered_modifiers", "order_data"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "locations"
  add_foreign_key "orders", "shipping_addresses"
  add_foreign_key "payment_methods", "merchants"
  add_foreign_key "paypal_payments", "clients"
  add_foreign_key "point_gains", "clients"
  add_foreign_key "purchase_vouchers", "clients"
  add_foreign_key "purchase_vouchers", "discounts"
  add_foreign_key "purchase_vouchers", "orders"
  add_foreign_key "purchase_vouchers", "voucher_codes"
  add_foreign_key "ratings", "clients"
  add_foreign_key "ratings", "locations"
  add_foreign_key "ratings", "orders"
  add_foreign_key "referrals", "users"
  add_foreign_key "shipping_addresses", "clients"
  add_foreign_key "sub_admins", "users"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "subscriptions", "merchants"
  add_foreign_key "subscriptions", "plans"
  add_foreign_key "tills", "locations"
  add_foreign_key "voucher_codes", "discounts"
  add_foreign_key "wish_lists", "categories"
  add_foreign_key "wish_lists", "clients"
end
