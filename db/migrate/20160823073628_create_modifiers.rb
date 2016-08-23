class CreateModifiers < ActiveRecord::Migration
  def change
    create_table :modifiers do |t|
    t.string   :name
    t.float    :price
    t.integer  :inventory_id
    t.float    :buy_price,    default: 0.0

      t.timestamps null: false
    end
  end
end
