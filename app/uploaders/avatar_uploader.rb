# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave 
  include CarrierWave::MiniMagick
  # storage :file
  # storage :fog
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # Create different versions of your uploaded files:
  version :small do
    process :resize_to_fit => [80, 80]
  end
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  # def filename
  #   "something.jpg" if original_filename
  # end
end
