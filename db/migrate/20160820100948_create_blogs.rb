class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.string :image
      t.text :keywords
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
