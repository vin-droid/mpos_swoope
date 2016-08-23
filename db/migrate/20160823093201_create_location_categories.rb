class CreateLocationCategories < ActiveRecord::Migration
	def change
		create_table :location_categories do |t|
			t.integer  "location_id"
			t.integer  "venue_cat_id"
			t.timestamps null: false
		end
	end
end
