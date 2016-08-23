class CreateServiceTimes < ActiveRecord::Migration
  def change
    create_table :service_times do |t|
    t.integer  :location_id
    t.integer  :day
    t.time     :from
    t.time     :to
    t.integer  :service_type
    t.datetime :created_at,                   null: false
    t.datetime :updated_at,                   null: false
    t.boolean  :is_open,      default: false

      t.timestamps null: false
    end
  end
end
