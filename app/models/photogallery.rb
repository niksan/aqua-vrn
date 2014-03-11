class Photogallery < ActiveRecord::Base

  validate :name, presence: true

  has_many :photos
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: [:history, :finders]

end
