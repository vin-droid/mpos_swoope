class LocationCategory < ActiveRecord::Base
  belongs_to :location
  belongs_to :venue_category
end
