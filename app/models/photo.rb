class Photo < ActiveRecord::Base

  validates :photogallery_id, presence: true
  validates :image, presence: true
  belongs_to :photogallery
  has_ancestry
  mount_uploader :image, PhotoUploader

end
