
# require 'geokit'
class Location < ActiveRecord::Base
	# acts_as_mappable :default_units => :miles,
	# :default_formula => :sphere,
	# :distance_field_name => :distance,
	# :lat_column_name => :latitude,
	# :lng_column_name => :longitude
	acts_as_mappable
	mount_uploader :image, AvatarUploader
	mount_uploader :second_image, AvatarUploader
	mount_uploader :logo, AvatarUploader
	has_many :offers,:dependent => :destroy
	has_many :inventories,:dependent => :destroy
	has_many :discounts,:dependent => :destroy
	enum tiers: ['Tier 1', 'Tier 2', 'Tier 3', 'Tier 4', 'Tier 5'] 
	belongs_to :venue_category
	has_many :ratings,:dependent => :destroy
	has_many :inv_cat,through: :inventories,:source => :category
	has_many :discounts,:dependent => :destroy
	has_many :service_times,:dependent => :destroy
	accepts_nested_attributes_for :service_times, :allow_destroy => true
	scope :venue_live, -> { where(is_live: true) }

	COUNTRY = ['USA', 'U K', 'San Francisco', 'South Africa', 'India']

	def full_address    
		[self.branch_name,self.address,self.post_code,self.city,'United Kingdom'].compact.join(', ')   
	end
	def avg_rating
		rating = self.ratings.pluck(:recommended)
		return rating.inject(&:+)/(rating.count) if rating.present?
		return 0 unless rating.present?
	end
	def tier_price
		case DateTime.current.strftime("%w").to_i
		when 0 then return self.sun_tier_price || 1
		when 1 then return self.mon_tier_price || 1
		when 2 then return self.tue_tier_price || 1
		when 3 then return self.wed_tier_price || 1
		when 4 then return self.thu_tier_price || 1
		when 5 then return self.fri_tier_price || 1
		when 6 then return self.sat_tier_price || 1    
		end
	end

end
