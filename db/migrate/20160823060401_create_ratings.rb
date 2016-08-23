class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    t.integer  :rate_value,    default: 0
    t.integer  :staff_quality, default: 0
    t.integer  :location_id
    t.integer  :recommended,   default: 0
    t.timestamps null: false
    end
  end
end
