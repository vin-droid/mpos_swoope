class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
    	t.string   :title,                default: ""
	    t.text     :terms_and_conditions, default: ""
	    t.string   :user_type,            default: ""
	    t.string   :offer_url,            default: ""
	    t.string   :caption,              default: ""
	    t.string   :detail,               default: ""
	    t.date     :start_date
	    t.date     :end_date
	    t.datetime :start_time
	    t.datetime :end_time
	    t.float    :full_price,           default: 0.0
	    t.float    :price,                default: 0.0
	    t.string   :offer_code,           default: ""
	    t.string   :uploaded_image,       default: ""
	    t.string   :offer_image,          default: ""
	    t.string   :applicable_to,        default: ""
	    t.string   :offer_type,           default: ""
	    t.integer  :quantity,             default: 0
	    t.integer  :beacon_id
	    t.boolean  :special_offer,        default: false
	    t.integer  :location_id
	    t.integer  :inventory_id
	    t.text     :applicable_days,  array: true, default: []

        t.timestamps null: false
    end
  end
end
