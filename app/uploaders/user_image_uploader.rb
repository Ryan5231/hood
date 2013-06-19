# encoding: utf-8

class UserImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :main do
    process :resize_to_fill => [300, 400]
  end

  version :thumb do
    process :resize_to_fill => [150, 150]
  end

  version :mini do
    process :resize_to_fill => [50, 50]
  end

end
