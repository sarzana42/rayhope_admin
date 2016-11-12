# encoding: utf-8

class KamonpicUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
 include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # JPEG 形式に変換して保存
  process convert: "jpg" 
  process resize_to_limit: [900, 900]
  
  version :thumb do
      process resize_to_limit: [480, 360]
  end
  
  # 拡張子 jpg jpeg gif png のみ許可
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  # ファイル名は original.jpg で保存 (jpeg変換しているので拡張子は固定)
  def filename
    "original.jpg" if original_filename
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end