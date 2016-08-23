class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
    t.string   :title,       default: ""
    t.integer  :category_id
    t.string   :image,       default: ""
    t.string   :black_icon

      t.timestamps null: false
    end
  end
end
