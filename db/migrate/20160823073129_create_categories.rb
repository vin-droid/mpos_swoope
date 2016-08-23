class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    t.string   :title,        default: ""
    t.string   :black_image,  default: ""
    t.boolean  :is_accepted,  default: true
    t.string   :category_tag
    t.string   :white_image

      t.timestamps null: false
    end
  end
end
