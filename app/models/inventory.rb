class Inventory < ActiveRecord::Base
	belongs_to :category
	belongs_to :subcategory
	belongs_to :location
	has_many :offers,:dependent => :destroy
	has_many :modifiers,:dependent => :destroy
	has_many :inventory_tiers,:dependent => :destroy
	accepts_nested_attributes_for :modifiers, :reject_if => lambda { |modifiers| ( modifiers['name'].blank? or modifiers['price'].blank?) }, :allow_destroy => true
	accepts_nested_attributes_for :inventory_tiers, :reject_if => lambda { |inventory_tier| ( inventory_tier['sell_price'] == '0.0' ) }, :allow_destroy => true
	mount_uploader :photo, AvatarUploader
	mount_uploader :qr_image, AvatarUploader
	scope :deleted, -> { where(is_deleted: false) }

end
