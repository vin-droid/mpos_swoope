class ServiceTime < ActiveRecord::Base
  belongs_to :location
  enum day: [:Sun,:Mon, :Tue, :Wed, :Thu, :Fri, :Sat]
  enum service_type: [:room_service,:delivery, :open_close]
  scope :room_service, -> { where(service_type: 0)}
  scope :delivery_service, -> { where(service_type: 1)}
  scope :open_close, -> { where(service_type: 2)}
end
