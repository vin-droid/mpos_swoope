class CreateInventories < ActiveRecord::Migration
    def change
        create_table :inventories do |t|
            t.string   :photo,          default: ""
            t.string   :name,           default: ""
            t.integer  :sort_value,     default: 0
            t.float    :sell_price,     default: 0.0
            t.float    :buy_price,      default: 0.0
            t.text     :description,    default: ""
            t.integer  :quantity,       default: 0
            t.integer  :location_id
            t.boolean  :is_deleted,     default: false

            t.timestamps null: false
        end
    end
end
