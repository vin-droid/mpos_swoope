class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :offers,:dependent => :destroy
  has_many :inventories, dependent: :destroy
  mount_uploader :image, AvatarUploader    
  mount_uploader :black_icon, AvatarUploader  
end
