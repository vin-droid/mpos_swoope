class Offer < ActiveRecord::Base
	belongs_to :category
	belongs_to :subcategory
	belongs_to :inventory
	belongs_to :location
	scope :not_expired, -> { where('start_time <= ? and end_time >= ?',DateTime.current,DateTime.current) }
	mount_uploader :offer_image, AvatarUploader
	mount_uploader :uploaded_image, AvatarUploader
	mount_uploader :qr_image, AvatarUploader
	has_many :likes, :dependent => :destroy
	scope :today, -> { where("created_at::date = ?", Date.today) }
	scope :yesterday_filter, -> { where("created_at::date = ?",(Date.today - 1.days) ) }
	scope :last_seven_days, -> { where("created_at::date >= ?", (Date.today - 7.days) ) }
	scope :last_thirty_days, -> { where("created_at::date >= ?", (Date.today - 30.days) ) }
	scope :by_day, lambda {|day| where("created_at::date >= ?", day ) }
	scope :special_offer, -> { where(special_offer: true).not_expired }

	def to_start_time_format
		self.start_time.utc.strftime("%H:%M") if self.start_time
	end
	def to_end_time_format
		self.end_time.utc.strftime("%H:%M") if self.end_time
	end
end
