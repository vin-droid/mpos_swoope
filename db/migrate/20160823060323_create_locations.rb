class CreateLocations < ActiveRecord::Migration
	def change
		create_table :locations do |t|
			t.boolean :is_table,default: false
			t.boolean :is_shipping,default: false
			t.string   :city,                                           default: ""
			t.string   :branch_name,                                    default: ""
			t.string   :address,                                        default: ""
			t.string   :post_code,                                      default: ""
			t.string   :country,                                        default: ""
			t.float    :latitude,                                       default: 0.0
			t.float    :longitude,                                      default: 0.0
			t.string   :image,                                          default: ""
			t.boolean  :is_table,                                       default: false
			t.boolean  :is_shipping,                                    default: false
			t.string   :email,                                          default: ""
			t.string   :website_address,                                default: ""
			t.string   :phone_no,                                       default: ""
			t.integer  :mon_tier_price,                                 default: 0
			t.integer  :tue_tier_price,                                 default: 0
			t.integer  :wed_tier_price,                                 default: 0
			t.integer  :thu_tier_price,                                 default: 0
			t.integer  :fri_tier_price,                                 default: 0
			t.integer  :sat_tier_price,                                 default: 0
			t.integer  :sun_tier_price,                                 default: 0
			t.integer  :max_delivery_time,                              default: 0
			t.string   :logo
			t.boolean  :is_order_collection
			t.string   :second_image
			t.decimal  :tax_percent,            precision: 4, scale: 2, default: 0.0
			t.decimal  :tips,                   precision: 6, scale: 2, default: 0.0
			t.boolean  :is_room_service,                                default: false
			t.boolean  :is_mobile_order_active,                         default: true
			t.boolean  :is_live,                                        default: false
			t.decimal  :min_spend,              precision: 6, scale: 2, default: 0.0
			t.timestamps null: false
		end
	end
end
    