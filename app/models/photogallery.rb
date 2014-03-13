class Photogallery < ActiveRecord::Base

  validate :name, presence: true

  has_many :photos
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: [:history, :finders]

  accepts_nested_attributes_for :photos, allow_destroy: true

end
