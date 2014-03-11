class Photo < ActiveRecord::Base

  validates :image, presence: true
  belongs_to :photogallery
  has_ancestry

end
