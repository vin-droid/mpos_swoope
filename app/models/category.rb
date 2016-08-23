class Category < ActiveRecord::Base
	
  # belongs_to :merchant
  has_many :subcategories, dependent: :destroy	
  has_many :inventories, dependent: :destroy	
  has_many :offers,:dependent => :destroy
  accepts_nested_attributes_for :subcategories, reject_if: :reject_title?, :allow_destroy => true
  mount_uploader :black_image, AvatarUploader
  mount_uploader :white_image, AvatarUploader
  # accepts_nested_attributes_for :subcategories
  has_many :wish_lists,:dependent => :destroy
  scope :approved, -> { where(:is_accepted => true) }
  scope :pending, -> { where(:is_accepted => false) }
  
  def reject_title?(attributed)
    attributed['title'].blank?
  end

end
