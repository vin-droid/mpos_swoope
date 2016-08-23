class CreateInventoryTiers < ActiveRecord::Migration
  def change
    create_table :inventory_tiers do |t|
      t.decimal  :sell_price,   precision: 8, scale: 2, default: 0.0
      t.integer  :tier,                                 default: 1
      t.integer  :inventory_id

      t.timestamps null: false
    end
  end
end
