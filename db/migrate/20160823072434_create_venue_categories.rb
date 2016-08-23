class CreateVenueCategories < ActiveRecord::Migration
  def change
    create_table :venue_categories do |t|
    	t.string   :title
        t.string   :image

      t.timestamps null: false
    end
  end
end
