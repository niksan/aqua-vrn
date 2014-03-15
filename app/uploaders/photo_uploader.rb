class PhotoUploader < CarrierWave::Uploader::Base

  include UploadImage

  version :thumb do
    process resize_to_fill: [100, 100]
  end

  version :small do
    process resize_to_fit: [285, 1000]
  end

  version :medium do
    process resize_to_fit: [1200, 800]
  end

end
