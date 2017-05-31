# app/uploaders/photo_uploader.rb
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_url
    "https://0.s3.envato.com/files/128276388/video_preview_0001.jpg"
  end
end
