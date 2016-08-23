class VenueCategory < ActiveRecord::Base
  has_many :locations,dependent: :destroy, through: :location_categories, :foreign_key => "venue_cat_id"
  mount_uploader :image, AvatarUploader
end
